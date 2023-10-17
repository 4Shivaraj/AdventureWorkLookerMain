view: prospective_buyer {
  sql_table_name: dbo.ProspectiveBuyer ;;

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
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.BirthDate ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: education {
    type: string
    sql: ${TABLE}.Education ;;
  }
  dimension: email_address {
    type: string
    sql: ${TABLE}.EmailAddress ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
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
  dimension: number_cars_owned {
    type: number
    sql: ${TABLE}.NumberCarsOwned ;;
  }
  dimension: number_children_at_home {
    type: number
    sql: ${TABLE}.NumberChildrenAtHome ;;
  }
  dimension: occupation {
    type: string
    sql: ${TABLE}.Occupation ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
  }
  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }
  dimension: prospect_alternate_key {
    type: string
    sql: ${TABLE}.ProspectAlternateKey ;;
  }
  dimension: prospective_buyer_key {
    type: number
    sql: ${TABLE}.ProspectiveBuyerKey ;;
  }
  dimension: salutation {
    type: string
    sql: ${TABLE}.Salutation ;;
  }
  dimension: state_province_code {
    type: string
    sql: ${TABLE}.StateProvinceCode ;;
  }
  dimension: total_children {
    type: number
    sql: ${TABLE}.TotalChildren ;;
  }
  dimension: unknown {
    type: number
    sql: ${TABLE}.Unknown ;;
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
