REPORT yr_tdd_game_r2_nmelliti.

CLASS lcl_russian_peasant_mult DEFINITION FINAL.

  PUBLIC SECTION.
    METHODS multiply
      IMPORTING
        left_operand  TYPE i
        right_operand TYPE i
      RETURNING
        VALUE(result) TYPE i.
    METHODS divide_by_2
      IMPORTING
        value         TYPE i
      RETURNING
        VALUE(result) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_russian_peasant_mult IMPLEMENTATION.


  METHOD multiply.

  ENDMETHOD.


  METHOD divide_by_2.
    result = value DIV 2.
  ENDMETHOD.

ENDCLASS.



CLASS ltc_russian_peasant_mult DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO lcl_russian_peasant_mult.
    METHODS:
      setup,
      acceptance_test FOR TESTING,
      divide_2_by_2 FOR TESTING,
      divide_3_by_2 FOR TESTING,
      divide_4_by_2 FOR TESTING,
      divide_47_by_2 FOR TESTING.
ENDCLASS.

CLASS ltc_russian_peasant_mult IMPLEMENTATION.
  METHOD setup.
    cut = NEW #(  ).
  ENDMETHOD.

  METHOD acceptance_test.
    cl_abap_unit_assert=>assert_equals( exp = 1974 act = cut->multiply( left_operand = 47
                                                                         right_operand = 42 ) ).
  ENDMETHOD.

  METHOD divide_2_by_2.
    cl_abap_unit_assert=>assert_equals( exp = 1 act = cut->divide_by_2( 2 ) ).
  ENDMETHOD.

  METHOD divide_3_by_2.
    cl_abap_unit_assert=>assert_equals( exp = 1 act = cut->divide_by_2( 3 ) ).
  ENDMETHOD.

  METHOD divide_4_by_2.
    cl_abap_unit_assert=>assert_equals( exp = 2 act = cut->divide_by_2( 4 ) ).
  ENDMETHOD.

  METHOD divide_47_by_2.
    cl_abap_unit_assert=>assert_equals( exp = 23 act = cut->divide_by_2( 47 ) ).
  ENDMETHOD.

ENDCLASS.
