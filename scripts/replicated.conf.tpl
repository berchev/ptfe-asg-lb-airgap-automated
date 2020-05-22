{
   "DaemonAuthenticationType":"password",
   "DaemonAuthenticationPassword":"${DaemonAuthenticationPassword}",
   "TlsBootstrapType":"server-path",
   "TlsBootstrapHostname":"${TlsBootstrapHostname}",
   "TlsBootstrapCert":"/opt/tfe-installer/fullchain.pem",
   "TlsBootstrapKey":"/opt/tfe-installer/privkey.pem",
   "BypassPreflightChecks":true,
   "ImportSettingsFrom":"/opt/tfe-installer/settings.json",
   "LicenseFileLocation":"/opt/tfe-installer/hashicorp-support-sofia.rli",
   "LicenseBootstrapAirgapPackagePath":"/opt/tfe-installer/${tfe_package}",
   "SnapshotsStore": "s3",
   "SnapshotsS3Bucket": "${snapshot_bucket_name}",
   "SnapshotsAWSRegion": "${s3_region}",
   "SnapshotsAWSKeyID": "${access_key}",
   "SnapshotsAWSSecretKey": "${secret_key}"
}