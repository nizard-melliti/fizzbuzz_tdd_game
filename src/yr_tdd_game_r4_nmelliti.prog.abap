REPORT yr_tdd_game_r4_nmelliti.

CLASS lcl_fizzbuzz DEFINITION FINAL.

  PUBLIC SECTION.
    METHODS fizzbuzz_value
      IMPORTING
        value         TYPE i
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
      three_is_fizz FOR TESTING RAISING cx_static_check.
ENDCLASS.

CLASS ltc_fizzbuzz IMPLEMENTATION.
  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD three_is_fizz.
    cl_abap_unit_assert=>assert_equals( exp = 'Fizz' act = cut->fizzbuzz_value( 3 ) ).
  ENDMETHOD.
ENDCLASS.
