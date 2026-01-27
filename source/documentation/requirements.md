# Set up your network for GovWifi

Before you offer GovWifi in your organisation, you need to make sure your existing wifi setup can support it.

For GovWifi to work alongside your existing wifi infrastructure, your:

- wifi infrastructure must use WPA2-Enterprise (AES) and WPA3-Enterprise encryption or newer
- wireless LAN controllers need to be able to point to one or more RADIUS (Remote Authentication Dial-In User Service) servers - we recommend at least 2
- network must be able to use one or more public IP addresses for connecting to the RADIUS servers
- firewall must allow RADIUS protocol to connect to the GovWifi authentication servers - port 1812/User Datagram Protocol (UDP) for authentication requests

It is important to allow authenticated users to connect to virtual private networks (VPNs) as well as standard internet protocols.

## Secure your network

GovWifi is more secure than traditional guest networks because giving each user a unique, randomly generated username and password is safer than giving one password - or ‘preshared key’ - to everyone.

However, you still need to put extra security measures in place yourself - especially as GovWifi can be used by your staff and members of the public.

As a minimum:

- set your network to use client isolation to prevent compromised devices attacking other devices
- use the [NCSC’s Protective DNS](https://www.ncsc.gov.uk/information/pdns) to protect against malicious domains
- block sites that breach your organisation’s acceptable use policy
- put monitoring in place to detect rogue access points that may broadcast a fake GovWifi network

To decide what other security measures to put in place, do a risk assessment based on your own setup and needs. Consider things like:

- deploying 802.1X profiles on managed devices to make sure they can only connect to the genuine GovWifi RADIUS servers
- stopping GovWifi users from accessing internal resources like printers
- making users connect to a VPN to access more sensitive information
- your ability to block and identify users who try to visit malicious sites or breach your acceptable use policy

## Check your network bandwidth

Make sure you’ll be able to provide enough bandwidth for the number of people you expect to use the network at once. You may need to plan for unpredictable use.

To make sure you can provide enough bandwidth:

- make sure you’re not broadcasting your wifi network at maximum strength, so it’s only available in the areas you need to use it in
- use your firewall to block things that takes up a lot of bandwidth, like streaming services or downloads over a certain size

## Configure your wireless access points 

Deploy centrally-managed hardware using the 5 GHz frequency band and Wi-Fi 5 (802.11ac). If you can, use Wi-Fi 6 (802.11ax).

Configure your wireless access points (APs) to:

- use a high basic data rate as your minimum
- disable lower data rates to encourage clients to roam to APs with stronger signals and increase capacity for all clients
- support IEEE 802.11ac Wave 2 standard for higher throughput and multiple input multiple output (MIMO)
- have maximum 4 service set identifiers (SSIDs) per band per site and selectively disable SSIDs where they are not required - each SSID uses up bandwidth with beaconing, probe requests and probe responses
- manage channel width by designing 802.11n/ac using 40 MHz width channels

You may enable wider channels (channel bonding) for 802.11ac, but you should configure them to fall back to a non-overlapping channel. Use automatic channel bonding if you can.

Use automatic channel selection features in enterprise wifi management systems rather than manual configuration.

After checking that your existing wifi setup can support GovWifi you can continue to:

- [setup GovWifi for your organisation](./set_up)
