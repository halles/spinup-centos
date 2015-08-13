module.exports = {
  mongodb: {
    server: 'localhost',
    port: 27017,
    autoReconnect: true,
    poolSize: 4,
    admin: true,
    auth: [
    ],
    adminUsername: '',
    adminPassword: '',
    whitelist: [],
    blacklist: []
  },

  site: {
    baseUrl: '/',
    port: 8981,
    cookieSecret: 'cookiesecret',
    sessionSecret: 'sessionsecret',
    cookieKeyName: 'mongo-express'
  },

  useBasicAuth: true,

  basicAuth: {
    username: 'root',
    password: ''
  },

  options: {
    documentsPerPage: 10,
    editorTheme: "rubyblue",
    cmdType: 'eval',
    subprocessTimeout: 300
  }
};
