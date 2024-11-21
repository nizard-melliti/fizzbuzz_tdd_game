REPORT yr_tdd_game_r3_nmelliti.

CLASS lcl_russian_peasant DEFINITION FINAL.

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
    METHODS multiply_by_2
      IMPORTING
        value         TYPE i
      RETURNING
        VALUE(result) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_russian_peasant IMPLEMENTATION.

  METHOD multiply.
    DATA(left) = left_operand.
    DATA(right) = right_operand.

    WHILE left >= 1.
      IF left MOD 2 <> 0.
        result += right.
      ENDIF.
      left = divide_by_2( left ).
      right = multiply_by_2( right ).
    ENDWHILE.
  ENDMETHOD.

  METHOD divide_by_2.
    result = value DIV 2.
  ENDMETHOD.


  METHOD multiply_by_2.
    result = value * 2.
  ENDMETHOD.

ENDCLASS.

CLASS ltc_russian_peasant DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO lcl_russian_peasant.
    METHODS:
      setup,
      acceptance_test_47_by_42 FOR TESTING,
      acceptance_test_15_by_2 FOR TESTING,
      divide_2_by_2 FOR TESTING,
      divide_3_by_2 FOR TESTING,
      divide_4_by_2 FOR TESTING,
      multiply_2_by_2 FOR TESTING,
      multiply_3_by_2 FOR TESTING,
      multiply_10_by_2 FOR TESTING.
ENDCLASS.

CLASS ltc_russian_peasant IMPLEMENTATION.
  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD acceptance_test_47_by_42.
    cl_abap_unit_assert=>assert_equals( exp = 1974
                                        act = cut->multiply( left_operand = 47 right_operand = 42 ) ).
  ENDMETHOD.

  METHOD acceptance_test_15_by_2.
    cl_abap_unit_assert=>assert_equals( exp = 30
                                        act = cut->multiply( left_operand = 15 right_operand = 2 ) ).
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

  METHOD multiply_2_by_2.
    cl_abap_unit_assert=>assert_equals( exp = 4 act = cut->multiply_by_2( 2 ) ).
  ENDMETHOD.

  METHOD multiply_3_by_2.
    cl_abap_unit_assert=>assert_equals( exp = 6 act = cut->multiply_by_2( 3 ) ).
  ENDMETHOD.

  METHOD multiply_10_by_2.
    cl_abap_unit_assert=>assert_equals( exp = 20 act = cut->multiply_by_2( 10 ) ).
  ENDMETHOD.

ENDCLASS.
