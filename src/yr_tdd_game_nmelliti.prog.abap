
REPORT yr_tdd_game_nmelliti.

CLASS lcl_fizzbuzz DEFINITION FINAL.

  PUBLIC SECTION.
    METHODS :
      fizzbuzz IMPORTING value         TYPE i
               RETURNING VALUE(result) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_fizzbuzz IMPLEMENTATION.

  METHOD fizzbuzz.
    result = COND #( WHEN value = 2 THEN '2'
                     WHEN value = 15 THEN 'FizzBuzz' ).                .
  ENDMETHOD.

ENDCLASS.



CLASS ltc_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO lcl_fizzbuzz.
    METHODS:
      setup,
      fizzbuzz_15 FOR TESTING,
      fizzbuzz_2 FOR TESTING.
ENDCLASS.


CLASS ltc_fizzbuzz IMPLEMENTATION.
  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD fizzbuzz_15.
    cl_abap_unit_assert=>assert_equals( exp = 'FizzBuzz' act = cut->fizzbuzz( 15 )  ).
  ENDMETHOD.

  METHOD fizzbuzz_2.
    cl_abap_unit_assert=>assert_equals( exp = '2' act = cut->fizzbuzz( 2 ) ).
  ENDMETHOD.
ENDCLASS.
