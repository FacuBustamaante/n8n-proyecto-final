
## 🚀 Guía de Inicio Rápido

### 1. Clonar y Organizar

Copiá los archivos en una carpeta local. La estructura debe ser:

**Plaintext**

```
.
├── docker-compose.yml
├── .env
├── init/
│   └── init.sql
└── workflow.json (Export de n8n)
```

### 2. Iniciar el Túnel (ngrok)

En una terminal aparte, ejecutá:

**Bash**

```
ngrok http 5680
```

**Importante:** Copiá la URL `https://...` resultante y pegala en los campos:

**Bash**

```
N8N_EDITOR_BASE_URL:= (PEGAR URL ACÁ)
WEBHOOK_URL= (PEGAR URL ACÁ)
```

### 3. Levantar los Contenedores

Ejecutá el siguiente comando para construir el entorno e inicializar la base de datos con los 20 productos de prueba:

**Bash**

```
docker-compose up -d
```

---

## 📊 Base de Datos e Inicialización

El proyecto incluye un archivo `init/init.sql` que se ejecuta automáticamente la primera vez.

* **Tablas:** `productos` y `categorias`.
* **Lógica:** Incluye una columna `stock_minimo` para alertas dinámicas.
