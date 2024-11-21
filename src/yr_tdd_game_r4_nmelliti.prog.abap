REPORT yr_tdd_game_r4_nmelliti.

CLASS lcl_fizzbuzz_value DEFINITION FINAL.

  PUBLIC SECTION.
    METHODS :
      constructor IMPORTING value TYPE i,
      get RETURNING VALUE(result) TYPE i.
  PRIVATE SECTION.
    DATA value TYPE i.

ENDCLASS.

CLASS lcl_fizzbuzz_value IMPLEMENTATION.
  METHOD constructor.
    me->value = value.
  ENDMETHOD.

  METHOD get.
    result = value.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_fizzbuzz DEFINITION FINAL.

  PUBLIC SECTION.
    METHODS fizzbuzz_value
      IMPORTING
        value         TYPE REF TO lcl_fizzbuzz_value
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_fizzbuzz IMPLEMENTATION.

  METHOD fizzbuzz_value.
    result = 'Fizz'.
  ENDMETHOD.

ENDCLASS.

CLASS ltc_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO lcl_fizzbuzz.
    METHODS:
      setup,
      three_is_fizz FOR TESTING.
ENDCLASS.

CLASS ltc_fizzbuzz IMPLEMENTATION.
  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD three_is_fizz.
    DATA(fizzbuzz_value) = NEW lcl_fizzbuzz_value( 3 ).
    cl_abap_unit_assert=>assert_equals( exp = 'Fizz' act = cut->fizzbuzz_value( fizzbuzz_value ) ).
  ENDMETHOD.
ENDCLASS.
