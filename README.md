# 🗄️ Riwi Supply

This repository contains the design, structure, and implementation of the relational database for **Riwi Supply**. The system is designed to efficiently manage the supplier purchasing lifecycle, multi-warehouse storage, and historical stock movement tracking.

---

## 🚀 Technologies and Tools

* **Database Engine:** MySQL v8.0+
* **Modeling Tool:** MySQL Workbench
* **ETL / Data Cleaning Strategy:** Data extraction and pre-cleaning using Microsoft Excel or Libre Office (text standardization, duplicate removal, and referential consistency validation prior to insertion).
* **Relational Model Design:** Draw.io

---

## 🗺️ Entity-Relationship Model (ERM)

Below is the relational structure generated in MySQL Workbench. You can visualize the interactive diagram directly on GitHub using the following Mermaid block:

```mermaid
erDiagram
    contries ||--o{ cities : "contains"
    cities ||--o{ suppliers : "locates"
    cities ||--o{ warehouses : "locates"
    warehouse_managers ||--o{ warehouses : "manages"
    
    categories ||--o{ sub_categories : "subdivides"
    sub_categories ||--o{ products : "classifies"
    measures ||--o{ products : "measures"
    
    suppliers ||--o{ purchase : "provides"
    purchase ||--o{ purchase_detail : "contains"
    products ||--o{ purchase_detail : "is included in"
    
    purchase_detail ||--o{ inventory_movements : "generates"
    warehouses ||--o{ inventory_movements : "stores"
    movements_types ||--o{ inventory_movements : "classifies"

    contries {
        tinyint id PK
        varchar name
    }
    cities {
        tinyint id PK
        varchar name
        tinyint id_country FK
    }
    suppliers {
        smallint id PK
        varchar name
        varchar nit
        varchar phone
        varchar email
        tinyint id_city FK
    }
    products {
        int id PK
        varchar name
        varchar description
        tinyint id_subcategory FK
        smallint id_measure FK
    }
```

## 👨‍💻 Author

- GitHub: **[Danilo-Doria](https://github.com/Danilo-Doria)**
- LinkedIn: **[Danilo Doria Diaz](https://www.linkedin.com/in/danilodd)**
- Mail: **danilodoria519@gmail.com**