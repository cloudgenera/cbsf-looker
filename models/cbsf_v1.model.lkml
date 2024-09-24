connection: "testbigquery"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: cbsf_v1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cbsf_v1_default_datagroup

explore: budgetitems {}

explore: budgets {}

explore: contract_detail {}

explore: budgetyears {}

explore: contract_summary {}

explore: contract_agreement {}