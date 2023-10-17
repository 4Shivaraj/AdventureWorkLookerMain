view: dim_organization {
  sql_table_name: dbo.DimOrganization ;;

  dimension: currency_key {
    type: number
    sql: ${TABLE}.CurrencyKey ;;
  }
  dimension: organization_key {
    type: number
    sql: ${TABLE}.OrganizationKey ;;
  }
  dimension: organization_name {
    type: string
    sql: ${TABLE}.OrganizationName ;;
  }
  dimension: parent_organization_key {
    type: number
    sql: ${TABLE}.ParentOrganizationKey ;;
  }
  dimension: percentage_of_ownership {
    type: string
    sql: ${TABLE}.PercentageOfOwnership ;;
  }
  measure: count {
    type: count
    drill_fields: [organization_name]
  }
}
