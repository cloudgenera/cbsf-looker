connection: "testbigquery"

# include all the views
include: "/views/**/*.view.lkml"

# include all the dashboards
include: "/dashboards/**/*.dashboard.lookml"

datagroup: cbsf_v1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cbsf_v1_default_datagroup

explore: budgetitems {
  join: budgets {
    type: left_outer
    sql_on: ${budgetitems.budget_name} = ${budgets.budget_name} ;;
    relationship: many_to_one
  }
}

explore: budgets {
  join: budgetyears {
    type: left_outer
    sql_on: ${budgets.budget_name} = ${budgetyears.budget_name} ;;
    relationship: one_to_many
  }
  join: budgetitems {
    type: left_outer
    sql_on: ${budgets.budget_name} = ${budgetitems.budget_name} ;;
    relationship: one_to_many
  }
}

explore: contract_detail {}

explore: budgetyears {
  join: budgets {
    type: left_outer
    sql_on: ${budgetyears.budget_name} = ${budgets.budget_name} ;;
    relationship: many_to_one
  }
}

explore: contract_summary {}

explore: contract_agreement {}
