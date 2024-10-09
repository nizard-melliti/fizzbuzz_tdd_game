REPORT yr_tdd_game_r2_nmelliti.

class lcl_russian_peasant_mult definition final.

  public section.
    METHODS multiply
      IMPORTING
        left_operand  TYPE i
        right_operand TYPE i
      RETURNING
        value(result) TYPE i.

  protected section.

  private section.

endclass.

class lcl_russian_peasant_mult implementation.


  METHOD multiply.

  ENDMETHOD.

endclass.



CLASS ltc_russian_peasant_mult DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO lcl_russian_peasant_mult.
    METHODS:
      setup,
      acceptance_test FOR TESTING.
ENDCLASS.


CLASS ltc_russian_peasant_mult IMPLEMENTATION.
  METHOD setup.
    cut = NEW #(  ).
  ENDMETHOD.

  METHOD acceptance_test.
    cl_abap_unit_assert=>assert_equals( exp = 1974 act = cut->multiply( left_operand = 47
                                                                         right_operand = 42 ) ).
  ENDMETHOD.
ENDCLASS.
