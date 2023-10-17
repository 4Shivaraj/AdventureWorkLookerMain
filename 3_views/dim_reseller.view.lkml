view: dim_reseller {
  sql_table_name: dbo.DimReseller ;;

  dimension: address_line1 {
    type: string
    sql: ${TABLE}.AddressLine1 ;;
  }
  dimension: address_line2 {
    type: string
    sql: ${TABLE}.AddressLine2 ;;
  }
  dimension: annual_revenue {
    type: string
    sql: ${TABLE}.AnnualRevenue ;;
  }
  dimension: annual_sales {
    type: string
    sql: ${TABLE}.AnnualSales ;;
  }
  dimension: bank_name {
    type: string
    sql: ${TABLE}.BankName ;;
  }
  dimension: business_type {
    type: string
    sql: ${TABLE}.BusinessType ;;
  }
  dimension: first_order_year {
    type: number
    sql: ${TABLE}.FirstOrderYear ;;
  }
  dimension: geography_key {
    type: number
    sql: ${TABLE}.GeographyKey ;;
  }
  dimension: last_order_year {
    type: number
    sql: ${TABLE}.LastOrderYear ;;
  }
  dimension: min_payment_amount {
    type: string
    sql: ${TABLE}.MinPaymentAmount ;;
  }
  dimension: min_payment_type {
    type: number
    sql: ${TABLE}.MinPaymentType ;;
  }
  dimension: number_employees {
    type: number
    sql: ${TABLE}.NumberEmployees ;;
  }
  dimension: order_frequency {
    type: string
    sql: ${TABLE}.OrderFrequency ;;
  }
  dimension: order_month {
    type: date_month_num
    sql: ${TABLE}.OrderMonth ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
  }
  dimension: product_line {
    type: string
    sql: ${TABLE}.ProductLine ;;
  }
  dimension: reseller_alternate_key {
    type: string
    sql: ${TABLE}.ResellerAlternateKey ;;
  }
  dimension: reseller_key {
    type: number
    sql: ${TABLE}.ResellerKey ;;
  }
  dimension: reseller_name {
    type: string
    sql: ${TABLE}.ResellerName ;;
  }
  dimension: year_opened {
    type: number
    sql: ${TABLE}.YearOpened ;;
  }
  measure: count {
    type: count
    drill_fields: [reseller_name, bank_name]
  }
}
