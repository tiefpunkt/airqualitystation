/*#include <LWiFi.h>
#include "vmnwsetting.h"

vm_wlan_scan_result_struct scan;
vm_wlan_scan_ap_info_struct network;

String result;

void initWiFi() {
  LWiFi.begin();
}

String getWifiNetworks() {
  result = "[";
  
  LWiFi.scanNetworks();
  scan = LWiFi.m_scanInfo;
  for (int i=0;i< scan.ap_list_num; i++) {
    if ( i > 0 ) {
      result += ",";
    }
    result += "{";
    
    network = scan.ap_list[i];
    
    result += "\"ssid\":\"";
    for (int j=0; j < network.ssid_len; j++) {
      result += (char)network.ssid[j];
    }
    
    result += ",\"bssid\":\"";
    for (int j=0; j < VM_WLAN_WNDRV_MAC_ADDRESS_LEN; j++) {
      if (j>0) {
        result += ":";
      }
      
      if (network.bssid[j] == 0x00) {
        result += "00";
      } else if (network.bssid[j] < 0x10) {
        result += "0";
        result += network.bssid[j];
      } else {
        result += network.bssid[j];
      }
    }
    
    result += "\",\"type\":\"";
    switch (network.network_type) {
      case VM_WLAN_NETWORK_TYPE_INFRA:
        result += "AP";
        break;
      case VM_WLAN_NETWORK_TYPE_ADHOC:
        result += "adhoc";
        break;
    }
    
    result += "\",\"encryption\":\"";
    switch (network.network_type) {
      case VM_WLAN_AUTH_MODE_OPEN:
        result += "open";
        break;
      case VM_WLAN_AUTH_MODE_WEP:
        result += "WEP";
        break;
      case VM_WLAN_AUTH_MODE_IEEE8021X:
        result += "IEEE802.1x";
        break;
      case VM_WLAN_AUTH_MODE_WPA_ONLY:
        result += "WPA Enterprise";
        break;
      case VM_WLAN_AUTH_MODE_WPA_ONLY_PSK:
        result += "WPA Only PSK";
        break;
      case VM_WLAN_AUTH_MODE_WAPICERT:
        result += "WAPICERT";
        break;
      case VM_WLAN_AUTH_MODE_WAPIPSK:
        result += "WAPIPSK";
        break;
      case VM_WLAN_AUTH_MODE_WPA2_ONLY:
        result += "WPA2 Enterprise";
        break;
      case VM_WLAN_AUTH_MODE_WPA_WPA2_MIX:
        result += "WPA WPA2 Mix Enterprise";
        break;
      case VM_WLAN_AUTH_MODE_WPA2_ONLY_PSK:
        result += "WPA2 Only PSK";
        break;
      case VM_WLAN_AUTH_MODE_WPA_WPA2_MIX_PSK:
        result += "WPA WPA2 Mix PSK";
        break;
    }
    
    result += "\",\"channel\":";
    result += network.channel_number;
    result += ",\"rssi\":";
    result += network.rssi;
    
    result += "}";
  }
  result += "]";
  return result;
}*/

