REPORT yr_tdd_game_r3_nmelliti.

CLASS lcl_russian_peasant DEFINITION FINAL.

  PUBLIC SECTION.
    METHODS multiply
      IMPORTING
        left_operand  TYPE i
        right_operand TYPE i
      RETURNING
        VALUE(result) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_russian_peasant IMPLEMENTATION.

  METHOD multiply.

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
      acceptance_test_15_by_2 FOR TESTING.
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
                                        act = cut->multiply( left_operand = 30 right_operand = 2 ) ).
  ENDMETHOD.

ENDCLASS.
