
rem =======================================================
rem create ref tables
rem =======================================================
@@ac_create_tables_alain_ref_person_product.sql

rem =======================================================
rem drop and create BDD tables
rem =======================================================
@@dc_drop_bdd_a_tables_alain.sql
@@ab_create_tables_alain_a_bdd.sql

rem =======================================================
rem populate BDD tables
rem =======================================================
@@ad_insert_into_tables_alain_a_person_product.sql
@@ae_insert_into_tables_alain_a_order_history.sql
@@ae_insert_into_tables_alain_a_order_history.sql
@@ae_insert_into_tables_alain_a_order_history.sql
rem =======================================================
rem DROP REF tables
rem =======================================================
@@db_drop_ref_tables.sql