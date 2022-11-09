view: supplier_new {
  sql_table_name: `mi-4-305707.railway_supplier_reliability.supplier`
    ;;

  dimension: supplier_city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: long {
    type: number
    sql: ${TABLE}.long ;;
  }

  dimension: supplier_cntry_cd {
    type: string
    sql: ${TABLE}.supplier_cntry_cd ;;
  }

  dimension: supplier_location {
    type: location
    sql_latitude: substr(cast(${lat} as string),0,5) ;;
    sql_longitude: substr(cast(${long} as string),0,5) ;;
  }

  dimension: supplier_name {
    type: string
    label: "Supplier name"
    sql: ${TABLE}.supplier_name ;;

  }

  dimension: supplier {
    type: string
    label: "Supplier"
    sql: ${TABLE}.supplier_name ;;
    link: {
      label: "{{ value }}"
      url: "https://tataconsultingservices.looker.com/dashboards/397?Supplier={{ value }}"
    }
  }
  dimension: supplier_num {
    type: number
    primary_key: yes
    sql: ${TABLE}.supplier_num ;;
  }

  dimension: supplier_region_cd {
    type: string
    sql: ${TABLE}.supplier_region_cd ;;
  }

  measure: count {
    type: count
    drill_fields: [supplier_name]
  }
}
