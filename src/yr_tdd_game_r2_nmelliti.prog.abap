REPORT yr_tdd_game_r2_nmelliti.

CLASS lcl_russian_peasant_mult DEFINITION FINAL.

  PUBLIC SECTION.
    METHODS:
      	multiply
        IMPORTING
          left_operand  TYPE i
          right_operand TYPE i
        RETURNING
          VALUE(result) TYPE i,
      divide_by_2
        IMPORTING
          value         TYPE i
        RETURNING
          VALUE(result) TYPE i,
      multiply_by_2
        IMPORTING
          value         TYPE i
        RETURNING
          VALUE(result) TYPE i,
      is_odd IMPORTING value         TYPE i
             RETURNING VALUE(result) TYPE abap_bool.

  PROTECTED SECTION.

  PRIVATE SECTION.
    CONSTANTS russian_limit TYPE i VALUE 1.
    CONSTANTS russian_magic_number TYPE i VALUE 2.
    	METHODS:
      	operand_for_next_iteration CHANGING left  TYPE i
                                          right TYPE i,
      add_right_op_to_result
        IMPORTING
                  right  TYPE i
        CHANGING  result TYPE i.

ENDCLASS.

CLASS lcl_russian_peasant_mult IMPLEMENTATION.

  METHOD multiply.
    DATA(left) = left_operand.
    DATA(right) = right_operand.

    WHILE left >= russian_limit.
      IF is_odd( left ).
        add_right_op_to_result( EXPORTING right = right
                                CHANGING result = result ).
      ENDIF.
      operand_for_next_iteration( CHANGING left = left
                                           right = right ).
    ENDWHILE.
  ENDMETHOD.

  METHOD add_right_op_to_result.
    result += right.
  ENDMETHOD.

  METHOD operand_for_next_iteration.
    left = divide_by_2( left ).
    right = multiply_by_2( right ).
  ENDMETHOD.

  METHOD divide_by_2.
    result = value DIV russian_magic_number.
  ENDMETHOD.

  METHOD multiply_by_2.
    result = value * russian_magic_number.
  ENDMETHOD.

  METHOD is_odd.
    result = boolC( value MOD russian_magic_number <> 0 ).
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
      multiply_russian_35_by_2 FOR TESTING,
      divide_2_by_2 FOR TESTING,
      divide_3_by_2 FOR TESTING,
      divide_4_by_2 FOR TESTING,
      divide_47_by_2 FOR TESTING,
      multiply_2_by_2 FOR TESTING,
      multiply_42_by_2 FOR TESTING.
ENDCLASS.

CLASS ltc_russian_peasant_mult IMPLEMENTATION.
  METHOD setup.
    cut = NEW #(  ).
  ENDMETHOD.

  METHOD acceptance_test.
    cl_abap_unit_assert=>assert_equals( exp = 1974 act = cut->multiply( left_operand = 47
                                                                         right_operand = 42 ) ).
  ENDMETHOD.

  METHOD multiply_russian_35_by_2.
    cl_abap_unit_assert=>assert_equals( exp = 70 act = cut->multiply( left_operand = 35
                                                                      right_operand = 2 ) ).
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

  METHOD multiply_2_by_2.
    cl_abap_unit_assert=>assert_equals( exp = 4 act = cut->multiply_by_2( 2 ) ).
  ENDMETHOD.

  METHOD multiply_42_by_2.
    cl_abap_unit_assert=>assert_equals( exp = 84 act = cut->multiply_by_2( 42 ) ).
  ENDMETHOD.
ENDCLASS.
