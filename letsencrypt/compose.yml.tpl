version: '2'
services:
  letsencrypt:
    image: janeczku/rancher-letsencrypt:v0.5.0
    environment:
      EULA: "${EULA}"
      API_VERSION: "${API_VERSION}"
      CERT_NAME: "${CERT_NAME}"
      EMAIL: "${EMAIL}"
      DOMAINS: "${DOMAINS}"
      PUBLIC_KEY_TYPE: "${PUBLIC_KEY_TYPE}"
      RENEWAL_TIME: "${RENEWAL_TIME}"
      PROVIDER: "${PROVIDER}"
      DNS_RESOLVERS: "${DNS_RESOLVERS}"
      RENEWAL_PERIOD_DAYS: "${RENEWAL_PERIOD_DAYS}"
      RUN_ONCE: "${RUN_ONCE}"
      CLOUDFLARE_EMAIL: "${CLOUDFLARE_EMAIL}"
      CLOUDFLARE_KEY: "${CLOUDFLARE_KEY}"
      AWS_ACCESS_KEY: "${AWS_ACCESS_KEY}"
      AWS_SECRET_KEY: "${AWS_SECRET_KEY}"
      VULTR_API_KEY: "${VULTR_API_KEY}"
    volumes:
      - /var/lib/rancher:/var/lib/rancher
      {{- if .Values.VOLUME_NAME}}
      - {{.Values.VOLUME_NAME}}:/etc/letsencrypt
      {{- end }}
    labels:
      io.rancher.container.create_agent: "true"
      io.rancher.container.agent.role: "environment"
      {{- if eq .Values.RUN_ONCE "true" }}
      io.rancher.container.start_once: "true"
      {{- end }}
{{- if .Values.VOLUME_NAME}}
volumes:
  {{.Values.VOLUME_NAME}}:
    {{- if .Values.STORAGE_DRIVER}}
    driver: {{.Values.STORAGE_DRIVER}}
    {{- if .Values.STORAGE_DRIVER_OPT}}
    driver_opts:
      {{.Values.STORAGE_DRIVER_OPT}}
    {{- end }}
    {{- end }}
{{- end }}
