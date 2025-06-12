view: contract_detail {
  sql_table_name: `TestBigQuery.cost_detail` ;;

  dimension: provider_id {
    type: string
    sql: ${TABLE}.provider_id ;;
  }
  dimension: cost_group_id {
    type: string
    sql: ${TABLE}.cost_group_id ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }
  dimension_group: invoice {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.date ;;
    convert_tz: no
  }
  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
  dimension: value_type {
    type: string
    sql: ${TABLE}.value_type ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
