rem =======================================================
rem drop ref tables
rem =======================================================
@@db_drop_ref_tables.sql

rem =======================================================
rem create ref tables
rem =======================================================
@@ac_create_tables_alain_ref_person_product.sql

rem =======================================================
rem drop and create BDD tables
rem =======================================================

@@dc_drop_bdd_a_tables_alain.sql
@@ab_create_tables_alain_a_bdd.sql
@@ac_alter_tables_alain_a_bdd.sql

rem =======================================================
rem populate BDD tables
rem =======================================================
@@ab_create_sequence_with_array.sql
@@ad_insert_into_tables_alain_a_person_product_with_seq.sql
@@ae_create_function_randint.sql
@@ae_create_proc_insert_into_table_a_order_history_sp_.sql
@@af_insert_into_tables_alain_a_order_history.sql

rem =======================================================
rem DROP REF tables
rem =======================================================
@@da_drop_sequences.sql
@@db_drop_ref_tables.sql
rem == da_truncate_bdd_a_tables_alain.sql
rem == db_db_alain_user_privileges_drop.sql
rem ==@@ea_explain_plan_index_test_on_table_a_product.sql