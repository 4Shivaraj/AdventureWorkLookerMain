view: dim_customer {
  sql_table_name: dbo.DimCustomer ;;

  dimension: address_line1 {
    type: string
    sql: ${TABLE}.AddressLine1 ;;
  }
  dimension: address_line2 {
    type: string
    sql: ${TABLE}.AddressLine2 ;;
  }
  dimension_group: birth {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.BirthDate ;;
  }
  dimension: commute_distance {
    type: string
    sql: ${TABLE}.CommuteDistance ;;
  }
  dimension: customer_alternate_key {
    type: string
    sql: ${TABLE}.CustomerAlternateKey ;;
  }
  dimension: customer_key {
    type: number
    sql: ${TABLE}.CustomerKey ;;
  }
  dimension_group: date_first_purchase {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DateFirstPurchase ;;
  }
  dimension: email_address {
    type: string
    sql: ${TABLE}.EmailAddress ;;
  }
  dimension: english_education {
    type: string
    sql: ${TABLE}.EnglishEducation ;;
  }
  dimension: english_occupation {
    type: string
    sql: ${TABLE}.EnglishOccupation ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }
  dimension: french_education {
    type: string
    sql: ${TABLE}.FrenchEducation ;;
  }
  dimension: french_occupation {
    type: string
    sql: ${TABLE}.FrenchOccupation ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }
  dimension: geography_key {
    type: number
    sql: ${TABLE}.GeographyKey ;;
  }
  dimension: house_owner_flag {
    type: string
    sql: ${TABLE}.HouseOwnerFlag ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }
  dimension: marital_status {
    type: string
    sql: ${TABLE}.MaritalStatus ;;
  }
  dimension: middle_name {
    type: string
    sql: ${TABLE}.MiddleName ;;
  }
  dimension: name_style {
    type: string
    sql: ${TABLE}.NameStyle ;;
  }
  dimension: number_cars_owned {
    type: number
    sql: ${TABLE}.NumberCarsOwned ;;
  }
  dimension: number_children_at_home {
    type: number
    sql: ${TABLE}.NumberChildrenAtHome ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
  }
  dimension: spanish_education {
    type: string
    sql: ${TABLE}.SpanishEducation ;;
  }
  dimension: spanish_occupation {
    type: string
    sql: ${TABLE}.SpanishOccupation ;;
  }
  dimension: suffix {
    type: string
    sql: ${TABLE}.Suffix ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }
  dimension: total_children {
    type: number
    sql: ${TABLE}.TotalChildren ;;
  }
  dimension: yearly_income {
    type: string
    sql: ${TABLE}.YearlyIncome ;;
  }
  measure: count {
    type: count
    drill_fields: [first_name, middle_name, last_name]
  }
}
