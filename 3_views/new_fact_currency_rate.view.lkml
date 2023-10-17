view: new_fact_currency_rate {
  sql_table_name: dbo.NewFactCurrencyRate ;;

  dimension: average_rate {
    type: number
    sql: ${TABLE}.AverageRate ;;
  }
  dimension_group: currency {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.CurrencyDate ;;
  }
  dimension: currency_id {
    type: string
    sql: ${TABLE}.CurrencyID ;;
  }
  dimension: currency_key {
    type: number
    sql: ${TABLE}.CurrencyKey ;;
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
