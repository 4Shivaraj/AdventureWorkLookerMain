view: fact_currency_rate {
  sql_table_name: dbo.FactCurrencyRate ;;

  dimension: average_rate {
    type: number
    sql: ${TABLE}.AverageRate ;;
  }
  dimension: currency_key {
    type: number
    sql: ${TABLE}.CurrencyKey ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Date ;;
  }
  dimension: date_key {
    type: number
    sql: ${TABLE}.DateKey ;;
  }
  dimension: end_of_day_rate {
    type: number
    sql: ${TABLE}.EndOfDayRate ;;
  }
  measure: count {
    type: count
  }
}
