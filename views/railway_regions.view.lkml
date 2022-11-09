view: railway_regions {
  sql_table_name: `mi-4-305707.railway_supplier_reliability.railway_regions`
    ;;

  dimension: store_cd {
    type: string
    primary_key: yes
    sql: ${TABLE}.store_cd ;;
  }

  dimension: store_country_cd {
    type: string
    sql: ${TABLE}.store_country_cd ;;
  }

  dimension: store_latitude {
    type: number
    sql: ${TABLE}.store_latitude ;;
  }

  dimension: store_longitude {
    type: number
    sql: ${TABLE}.store_longitude ;;
  }

  dimension: store_location {
    type: location
    sql_latitude: substr(cast(${store_latitude} as string),0,5) ;;
    sql_longitude: substr(cast(${store_longitude} as string),0,5) ;;
  }

  dimension: store_name {
    type: string
    label: "Store name"
    sql: ${TABLE}.store_name ;;
    #link: {
    #  label: "{{ value }}"
    #  url: "https://tataconsultingservices.looker.com/dashboards/395?Store={{ value }}"
    #}
  }

  dimension: store_regional_cd {
    type: string
    sql: ${TABLE}.store_regional_cd ;;
  }

  measure: count {
    type: count
    drill_fields: [store_name]
  }
}
