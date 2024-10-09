REPORT yr_tdd_game_nmelliti.

CLASS lcl_fizzbuzz DEFINITION FINAL.

  PUBLIC SECTION.
    METHODS :
      fizzbuzz IMPORTING value         TYPE i
               RETURNING VALUE(result) TYPE string,
      is_divided_by_3
        IMPORTING
          value         TYPE i
        RETURNING
          VALUE(result) TYPE abap_bool,
      is_dividedby5
        IMPORTING
          i_7             TYPE i
        RETURNING
          VALUE(r_result) TYPE abap_bool.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_fizzbuzz IMPLEMENTATION.

  METHOD fizzbuzz.
    result = COND #( WHEN value = 1 THEN '1'
                     WHEN value = 2 THEN '2'
                     WHEN value = 15 THEN 'FizzBuzz' ).                .
  ENDMETHOD.

  METHOD is_divided_by_3.
    result = boolC( value MOD 3 = 0 ).
  ENDMETHOD.


  METHOD is_dividedby5.

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
      fizzbuzz_2 FOR TESTING,
      fizzbuzz_1 FOR TESTING,
      n3_is_dividedby_3 FOR TESTING,
      n6_is_dividedby_3 FOR TESTING,
      n7_isnot_dividedby_3 FOR TESTING,
      acceptance_test FOR TESTING.
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
  METHOD fizzbuzz_1.
    cl_abap_unit_assert=>assert_equals( exp = '1' act = cut->fizzbuzz( 1 ) ).
  ENDMETHOD.

  METHOD n3_is_dividedby_3.
    cl_abap_unit_assert=>assert_true( cut->is_divided_by_3( 3 ) ).
  ENDMETHOD.

  METHOD n6_is_dividedby_3.
    cl_abap_unit_assert=>assert_true( cut->is_divided_by_3( 6 ) ).
  ENDMETHOD.

  METHOD n7_isnot_dividedby_3.
    cl_abap_unit_assert=>assert_false( cut->is_dividedby5( 7 ) ).
  ENDMETHOD.

  METHOD acceptance_test.
    cl_abap_unit_assert=>assert_equals( exp = 'FizzBuzz' act = cut->fizzbuzz( 30 ) ).
  ENDMETHOD.



ENDCLASS.
