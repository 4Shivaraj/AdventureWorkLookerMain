view: dim_employee {
  sql_table_name: dbo.DimEmployee ;;

  dimension: base_rate {
    type: string
    sql: ${TABLE}.BaseRate ;;
  }
  dimension_group: birth {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.BirthDate ;;
  }
  dimension: current_flag {
    type: string
    sql: ${TABLE}.CurrentFlag ;;
  }
  dimension: department_name {
    type: string
    sql: ${TABLE}.DepartmentName ;;
  }
  dimension: email_address {
    type: string
    sql: ${TABLE}.EmailAddress ;;
  }
  dimension: emergency_contact_name {
    type: string
    sql: ${TABLE}.EmergencyContactName ;;
  }
  dimension: emergency_contact_phone {
    type: string
    sql: ${TABLE}.EmergencyContactPhone ;;
  }
  dimension: employee_key {
    type: number
    sql: ${TABLE}.EmployeeKey ;;
  }
  dimension: employee_national_idalternate_key {
    type: string
    sql: ${TABLE}.EmployeeNationalIDAlternateKey ;;
  }
  dimension: employee_photo {
    type: string
    sql: ${TABLE}.EmployeePhoto ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.EndDate ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }
  dimension_group: hire {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.HireDate ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }
  dimension: login_id {
    type: string
    sql: ${TABLE}.LoginID ;;
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
  dimension: parent_employee_key {
    type: number
    sql: ${TABLE}.ParentEmployeeKey ;;
  }
  dimension: parent_employee_national_idalternate_key {
    type: string
    sql: ${TABLE}.ParentEmployeeNationalIDAlternateKey ;;
  }
  dimension: pay_frequency {
    type: number
    sql: ${TABLE}.PayFrequency ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
  }
  dimension: salaried_flag {
    type: string
    sql: ${TABLE}.SalariedFlag ;;
  }
  dimension: sales_person_flag {
    type: string
    sql: ${TABLE}.SalesPersonFlag ;;
  }
  dimension: sales_territory_key {
    type: number
    sql: ${TABLE}.SalesTerritoryKey ;;
  }
  dimension: sick_leave_hours {
    type: number
    sql: ${TABLE}.SickLeaveHours ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.StartDate ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }
  dimension: vacation_hours {
    type: number
    sql: ${TABLE}.VacationHours ;;
  }
  measure: count {
    type: count
    drill_fields: [first_name, last_name, middle_name, emergency_contact_name, department_name]
  }
}
