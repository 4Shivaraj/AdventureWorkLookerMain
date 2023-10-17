view: v_time_series {
  sql_table_name: dbo.vTimeSeries ;;

  dimension: amount {
    type: string
    sql: ${TABLE}.Amount ;;
  }
  dimension: calendar_year {
    type: number
    sql: ${TABLE}.CalendarYear ;;
  }
  dimension: model_region {
    type: string
    sql: ${TABLE}.ModelRegion ;;
  }
  dimension: month {
    type: number
    sql: ${TABLE}.Month ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }
  dimension_group: reporting {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ReportingDate ;;
  }
  dimension: time_index {
    type: number
    sql: ${TABLE}.TimeIndex ;;
  }
  measure: count {
    type: count
  }
}
