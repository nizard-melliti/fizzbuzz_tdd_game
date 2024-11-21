REPORT yr_tdd_game_r3_nmelliti.

CLASS lcl_russian_peasant DEFINITION FINAL.

  PUBLIC SECTION.

    METHODS:
      multiply IMPORTING
                 left_operand  TYPE i
                 right_operand TYPE i
               RETURNING
                 VALUE(result) TYPE i,
      divide_by_2 IMPORTING
                    value         TYPE i
                  RETURNING
                    VALUE(result) TYPE i,
      multiply_by_2 IMPORTING
                      value         TYPE i
                    RETURNING
                      VALUE(result) TYPE i.

  PRIVATE SECTION.
    CONSTANTS: value_to_stop TYPE i VALUE 1,
               russian_value TYPE i VALUE 2.
    METHODS :
      is_not_crossed_out IMPORTING value         TYPE i
                         RETURNING VALUE(result) TYPE abap_bool,
      prepare_data_next_iteration CHANGING left_value  TYPE i
                                           right_value TYPE i.
ENDCLASS.

CLASS lcl_russian_peasant IMPLEMENTATION.
  METHOD multiply.
    DATA(left_value) = left_operand.
    DATA(right_value) = right_operand.

    WHILE left_value >= value_to_stop.
      IF is_not_crossed_out( left_value ).
        result += right_value.
      ENDIF.
      prepare_data_next_iteration( CHANGING left_value = left_value
                                            right_value = right_value ).
    ENDWHILE.
  ENDMETHOD.

  METHOD prepare_data_next_iteration.
    left_value = divide_by_2( left_value ).
    right_value = multiply_by_2( right_value ).
  ENDMETHOD.

  METHOD divide_by_2.
    result = value DIV russian_value.
  ENDMETHOD.

  METHOD multiply_by_2.
    result = value * russian_value.
  ENDMETHOD.

  METHOD is_not_crossed_out.
    result = boolC( value MOD 2 <> 0 ).
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
