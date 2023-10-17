view: dim_currency {
  sql_table_name: dbo.DimCurrency ;;

  dimension: currency_alternate_key {
    type: string
    sql: ${TABLE}.CurrencyAlternateKey ;;
  }
  dimension: currency_key {
    type: number
    sql: ${TABLE}.CurrencyKey ;;
  }
  dimension: currency_name {
    type: string
    sql: ${TABLE}.CurrencyName ;;
  }
  measure: count {
    type: count
    drill_fields: [currency_name]
  }
}
