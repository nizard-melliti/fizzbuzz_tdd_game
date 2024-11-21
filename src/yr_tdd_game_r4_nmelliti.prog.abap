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
      three_is_fizz FOR TESTING,
      four_is_4 FOR TESTING,
      five_is_buzz FOR TESTING,
      fifteen_is_fizzbuzz FOR TESTING,
      fizzbuzz_value
        IMPORTING
          value         TYPE REF TO lcl_fizzbuzz_value
        RETURNING
          VALUE(result) TYPE string.
ENDCLASS.

CLASS ltc_fizzbuzz IMPLEMENTATION.
  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD three_is_fizz.
    cl_abap_unit_assert=>assert_equals( exp = 'Fizz' act = fizzbuzz_value( NEW lcl_fizzbuzz_value( 3 ) ) ).
  ENDMETHOD.

  METHOD four_is_4.
    cl_abap_unit_assert=>assert_equals( exp = '4' act = fizzbuzz_value( NEW lcl_fizzbuzz_value( 4 ) ) ).
  ENDMETHOD.

  METHOD five_is_buzz.
    cl_abap_unit_assert=>assert_equals( exp = 'Buzz' act = fizzbuzz_value( NEW lcl_fizzbuzz_value( 5 ) ) ).
  ENDMETHOD.

  METHOD fizzbuzz_value.
    result = COND #( WHEN value->get( ) MOD 3 = 0 AND value->get( ) MOD 5 = 0 THEN 'FizzBuzz'
                     WHEN value->get( ) MOD 3 = 0 THEN 'Fizz'
                     WHEN value->get( ) MOD 5 = 0 THEN 'Buzz'
                     ELSE |{ value->get( ) }| ).
  ENDMETHOD.

  METHOD fifteen_is_fizzbuzz.
    cl_abap_unit_assert=>assert_equals( exp = 'FizzBuzz' act = fizzbuzz_value( NEW lcl_fizzbuzz_value( 15 ) ) ).
  ENDMETHOD.
ENDCLASS.
