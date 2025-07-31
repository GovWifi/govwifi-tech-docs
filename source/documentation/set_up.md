Before offering GovWifi in your organisation check that [your existing wifi setup can support it](./requirements/).

# Set up GovWifi for your organisation

> Follow these steps only if you will be the administrator for your organisation.

> To connect to GovWifi for individual use, follow the instructions to [create a GovWifi account and connect to GovWifi](https://www.wifi.service.gov.uk/connect-to-govwifi/).

1. Check if [GovWifi is available to your organisation](https://www.wifi.service.gov.uk/organisations-using-govwifi/). If your organisation is not listed [contact us](https://admin.wifi.service.gov.uk/help/new/technical_support).
2. [Sign up for a GovWifi administrator account](https://admin.wifi.service.gov.uk/users/sign_up).

Before setting up two-factor authentication, please ensure your two-factor authentication device time & date is correct e.g. with internet time. Device time drift can cause authentication failures.

After creating your account you must invite at least one colleague to create an account. This is so that a colleague can reset your two-factor authentication, if needed.

Invite them from the **team members** section of your GovWifi admin account.

## Sign the memorandum of understanding

You must [sign the memorandum of understanding](https://www.wifi.service.gov.uk/memorandum-of-understanding/) (MOU) before your organisation can begin installing GovWifi.

The MOU sets out the agreement between the Cabinet Office (CO) and your public sector organisation in relation to GovWifi use.

## Create a new wifi installation

Create a [network address translation (NAT) rule](https://wiki.untangle.com/index.php/NAT_Rules) if one does not already exist.

This allows your wifi controller or access points to connect to the internet using the IP addresses you'll add to your GovWifi admin account.

### Set up your public IP addresses

Add your IP addresses to your [GovWifi admin account](https://admin.wifi.service.gov.uk/ips).

Details of the RADIUS (Remote Authentication Dial-In User Service) servers are in your [GovWifi admin account](https://admin.wifi.service.gov.uk/setup_instructions/initial) under **settings**.

You must connect to at least one RADIUS server in each region (one from the London list and one from the Dublin one). You can configure your authenticators to connect to more than two RADIUS servers. These extra servers are known as ‘backups’ or ‘failovers’.

We recommend connecting to all GovWifi RADIUS servers, so you're protected from a single server being unavailable.

### Configure your infrastructure

1. Create a firewall rule to allow traffic on User Datagram Protocol (UDP) ports 1812 to reach the RADIUS IP addresses assigned to you. Do not point UDP port 1813 at GovWifi RADIUS IPs - GovWifi does not support RADIUS accounting and port 1813 is closed.
2. Create a service set identifier (SSID) with:
    * name: GovWifi
    * type: WPA2-Enterprise (AES encryption) and WPA3- Enterprise

> Make sure you spell GovWifi exactly as shown. Do not use a variation like 'Govwifi' or 'GovWiFi'. If different GovWifi networks format the SSID differently, users will have to authenticate to each one rather than connecting automatically. Their devices will not recognise them as the same network.

## Set up managed end user devices

Users must follow the [GovWifi terms and conditions](https://www.gov.uk/government/publications/terms-and-conditions-for-connecting-to-govwifi/terms-and-conditions-for-connecting-to-govwifi) for managed and unmanaged devices.

### Remotely deploy GovWifi profiles to managed devices

You must deploy profiles to your managed devices for automatic certificate checking. You could use mobile device
management solutions or operating system mechanisms for this. For example, you can deploy profiles on:

* [Windows devices using Group Policy](https://en.wikipedia.org/wiki/Group_Policy)
* [Apple devices using Profile Manager](https://support.apple.com/en-gb/profile-manager)

### Get the XML profile for Windows devices

Make the [GovWifi profile configuration XML file](https://docs.wifi.service.gov.uk/assets/govwifi-profile.xml) available
to your users - for example, you could host this file on an intranet web server. The devices will then be able to
verify their certificate against the XML file to confirm whether those devices are authorised to join the network.

The user will only need to enter their username and password after signing up to the service.

### Deploy XML profile to managed devices

Add the following to your users’ login script:

```sh
netsh wlan add profile filename="PATH_TO_PROFILE" user=all
```

Where `PATH_TO_PROFILE` is your file path.

For example:

```sh
netsh wlan add profile filename="govwifi-profile.xml" user=all
```

Read about how to [create certificate profiles in configuration manager](https://docs.microsoft.com/en-us/previous-versions/system-center/system-center-2012-R2/dn270541(v=technet.10)).

### Prioritise the GovWifi profile

GovWifi should be set as the highest priority service set identifier (SSID) in your organisation. This does not apply when internal SSIDs are providing access to privileged networks using certificate based authentication.

Add the following to your users’ login script:

```sh
netsh wlan set profileorder name="GovWifi" interface="NAME" priority=1
```

Where `NAME` is your environment’s name.

For example:

```sh
netsh wlan set profileorder name="GovWifi" interface="Wi-Fi" priority=1
```

## Sign up for incident alerts 

Subscribe to updates on the [GovWifi status page](https://status.wifi.service.gov.uk/) to be notified when there's an incident. 

It's best to sign up using the shared, monitored email address you entered on GovWifi admin. 

## Create a plan to deal with a GovWifi outage 

If GovWifi is critical for your organisation, you must create and regularly test a business continuity plan so you can still provide internet access in your buildings if there’s a problem with GovWifi. 

We should be able to resolve most incidents within a few hours. However, in the unlikely event that there’s a catastrophic failure of our infrastructure, it could take up to 5 days to restore the service.

Consult with your risk assessment and technology teams on your business continuity plan. 

### Set up a backup SSID

We strongly recommend you have a backup guest SSID that people in your buildings can use if there’s a long GovWifi outage. 

When setting up your backup guest SSID: 

- make sure it meets our [security standards](./requirements.html#secure-your-network), and points users to any terms of use your organisation has 
- do not use ‘GovWifi’ as the SSID, or you might have potential conflicts when GovWifi is working again 
- make sure you can easily disable it when GovWifi is working again 

Run regular tests of the SSID to make sure you can quickly switch to it if required.

### Plan how you'll tell your users 

Plan how you’ll tell your users to use the backup SSID. Make sure your users on managed devices will be able to connect to the backup SSIDs created by each building if they’re roaming.

Share the relevant parts of your business continuity plan with your user support team so they know how to help users.

### Document how to update the GovWifi configuration

If GovWifi is going to be down for a long time, we might ask you to update your GovWifi configuration with temporary IP addresses for our RADIUS servers.

Make sure you’ve documented how to update the GovWifi configuration at your site so you can do this if necessary.