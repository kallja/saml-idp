const { runServer } = require("saml-idp");
const config = require("./config");

runServer({
  acsUrl: `https://foo.okta.com/auth/saml20/assertion-consumer`,
  audience: `https://foo.okta.com/auth/saml20/metadata`,
  cert: "./keys/idp-public-cert.pem",
  key: "./keys/idp-private-key.pem",
  ...config,
});
