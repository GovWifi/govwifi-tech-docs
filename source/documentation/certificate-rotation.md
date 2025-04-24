# Certificate rotation

Every year, we rotate the GovWifi server certificate. Occasionally, we’ll also need to replace the intermediate or root certificates. This is an industry standard procedure that keeps the authentication process secure.

We’ll give you at least one month’s notice about certificate rotations. The next one is scheduled for Wednesday 28th May 2025.

The GovWifi team carries out the certificate rotation on the RADIUS servers, but your organisation may need to do some work to make sure your users can connect to GovWifi after the rotation.

You do not need to do anything to your access points, wifi controllers or any other part of your wifi hardware.

## Update the profile on managed devices

This section applies to you if your organisation does both of the following:

* deploys the GovWifi 802.1x profile
* tells user devices to check the ‘server’ certificate (currently wifi.service.gov.uk) or intermediate certificate (currently GeoTrust TLS RSA CA G1) or root certificate (currently DigiCert Global Root G2)

If you need to update the profile with the new certificate details you must push the updated profile out to your managed devices. How you manage this will depend on how you deploy your GovWifi 802.1x profile to your managed devices.

Download the new certificates for 2024:

* [server certificate](https://docs.wifi.service.gov.uk/assets/2024/wifi.service.gov.uk.crt)
* [intermediate certificate](https://docs.wifi.service.gov.uk/assets/2024/GeoTrustTLSRSACAG1.crt)
* [root certificate](https://docs.wifi.service.gov.uk/assets/2024/DigiCertGlobalRootG2.crt)

## Help users accept the new certificate

We’ve published [guidance for users](https://www.wifi.service.gov.uk/update-govwifi-server-certificate/) on what to do. However, they may still need help from your IT support team.

### What they need to do may vary

Users' devices might automatically check the new certificate and accept it. In this case, they will not need to do anything.

Or, they may be asked to accept the new certificate.

### If they're asked to accept the new certificate

They should:

1. View the certificate.
1. Check that the domain is **wifi.service.gov.uk**
1. Check the issuer is **GeoTrust TLS RSA CA G1**
1. Check that the fingerprint or thumbprint is **28 E3 61 41 29 8E 98 25 2E 68 C4 50 D7 16 5A B2 19 41 14 F6**
1. Accept or trust the new certificate.

Depending on their device, they may not be able to see all the information referred to here.

For example, this is what it looks like on a Mac:

![Screenshot of certificate verification on Mac OS](https://docs.wifi.service.gov.uk/assets/images/screenshot_macos.jpg)

### Possible problems

Users on managed devices may not have permission to accept the new certificate. The organisation that gave them the device needs to accept it for them.

Depending how a user's organisation deploys the profile, user’s may need to connect to the internet in a different way to pick up the updated profile.

If the user has accepted the certificate but still cannot connect, follow your usual troubleshooting process. You can also advise them to:

- forget the network and try to connect again
- follow our [guidance on common issues with GovWifi](https://www.wifi.service.gov.uk/get-help-connecting/)

## Get support

Sign up to [GovWifi Status Page](https://status.wifi.service.gov.uk/) to get our incident alerts. You can check this page for any outstanding issues that may impact your planned activities.

* if you have any questions fill in our [support form](https://admin.wifi.service.gov.uk/help)
* or you can [email us](mailto:govwifi-support@digital.cabinet-office.gov.uk)
