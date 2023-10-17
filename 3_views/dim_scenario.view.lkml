view: dim_scenario {
  sql_table_name: dbo.DimScenario ;;

  dimension: scenario_key {
    type: number
    sql: ${TABLE}.ScenarioKey ;;
  }
  dimension: scenario_name {
    type: string
    sql: ${TABLE}.ScenarioName ;;
  }
  measure: count {
    type: count
    drill_fields: [scenario_name]
  }
}
