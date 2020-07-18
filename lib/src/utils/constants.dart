// Todas las páginas que tenga tu servidor NODEJS
const String LOGIN_AUTH_URL =
    'https://magsa-sistems-db-heroku.herokuapp.com/auth/local';
const String ENTREGAR_PEDIDO_URL =
    'https://magsa-sistems-db-heroku.herokuapp.com/pedidos/'; // API PARA ENTREGAR UN PEDIDO

const ID_PROVEEDOR = "5f1069f7b729262efc8dac80";
const ID_ALMACEN = "5f106a27b729262efc8dad01";

// ESTADOS PEDIDOS

const STATUS_DEVUELTO = "5f106ec54c6f1f2b0404d803";
const STATUS_EN_RUTA = "5f106ec64c6f1f2b0404d804";
const STATUS_EN_LOCAL = "5f106ed44c6f1f2b0404d805";
const STATUS_ENTREGADO = "5f106ed94c6f1f2b0404d806";

// ESTADOS LIQUIDACION

const STATUS_AUSENTE = "5f106eaa4c6f1f2b0404d800";
const STATUS_PENDIENTE = "5f106eb54c6f1f2b0404d802";
const STATUS_EFECTIVO = "5f106eaf4c6f1f2b0404d801";
