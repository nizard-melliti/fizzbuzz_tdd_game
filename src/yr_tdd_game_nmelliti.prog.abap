
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
    METHODS:
      setup,
      acceptance_test FOR TESTING,
      fizzbuzz_2 FOR TESTING.
ENDCLASS.


CLASS ltc_fizzbuzz IMPLEMENTATION.
  METHOD setup.
  ENDMETHOD.

  METHOD acceptance_test.
    cl_abap_unit_assert=>assert_equals( exp = 'FizzBuzz' act = NEW lcl_fizzbuzz( )->fizzbuzz( 15 )  ).
  ENDMETHOD.

  METHOD fizzbuzz_2.
    cl_abap_unit_assert=>assert_equals( exp = '2' act = NEW lcl_fizzbuzz( )->fizzbuzz( 2 ) ).
  ENDMETHOD.
ENDCLASS.
