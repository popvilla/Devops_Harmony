import os
import shutil
import socket
import requests
import time
from datetime import datetime

# ======================
# SYSTEM PERFORMANCE ANALYSIS
# ======================

def get_performance_metrics():
    battery = ObjCClass('UIDevice').currentDevice().batteryLevel() * 100
    cpu_usage = psutil.cpu_percent(interval=1)
    memory_info = psutil.virtual_memory()
    
    return {
        "Battery Percentage": f"{battery:.1f}%",
        "CPU Usage": f"{cpu_usage}%",
        "Memory Usage": f"{memory_info.percent}%",
        "Total Memory": f"{memory_info.total / (1024**3):.2f} GB",
        "Available Memory": f"{memory_info.available / (1024**3):.2f} GB",
    }

# ======================
# STORAGE ANALYSIS
# ======================

def get_storage_info():
    total, used, free = shutil.disk_usage("/")
    
    return {
        "Total Storage": f"{total / (1024**3):.2f} GB",
        "Used Storage": f"{used / (1024**3):.2f} GB",
        "Free Storage": f"{free / (1024**3):.2f} GB",
    }

def find_large_files(path="/", threshold_mb=50):
    large_files = []
    for root, _, files in os.walk(path):
        for file in files:
            try:
                file_path = os.path.join(root, file)
                size = os.path.getsize(file_path) / (1024 * 1024)
                if size > threshold_mb:
                    large_files.append((file_path, f"{size:.2f} MB"))
            except:
                pass
    return large_files[:10]  # Limit results

# ======================
# NETWORK ANALYSIS
# ======================

def get_network_info():
    hostname = socket.gethostname()
    local_ip = socket.gethostbyname(hostname)
    
    try:
        external_ip = requests.get('https://api64.ipify.org?format=json').json()["ip"]
    except:
        external_ip = "Unable to fetch"
    
    return {
        "Hostname": hostname,
        "Local IP": local_ip,
        "External IP": external_ip,
    }

# ======================
# HEALTH & FITNESS DATA (Requires Permissions)
# ======================


    
    HKQuantityTypeIdentifierStepCount = ObjCClass("HKQuantityType").quantityTypeForIdentifier_("HKQuantityTypeIdentifierStepCount")
    HKQuantityTypeIdentifierHeartRate = ObjCClass("HKQuantityType").quantityTypeForIdentifier_("HKQuantityTypeIdentifierHeartRate")
    
    step_count_query = health_store.mostRecentQuantitySampleForType_error_(HKQuantityTypeIdentifierStepCount, None)
    heart_rate_query = health_store.mostRecentQuantitySampleForType_error_(HKQuantityTypeIdentifierHeartRate, None)
    
    return {
        "Recent Steps": step_count_query.quantity().doubleValueForUnit_(ObjCClass("HKUnit").countUnit()) if step_count_query else "Unavailable",
        "Recent Heart Rate": heart_rate_query.quantity().doubleValueForUnit_(ObjCClass("HKUnit").countUnit()) if heart_rate_query else "Unavailable",
    }

# ======================
# MEDIA ANALYSIS (PHOTOS & VIDEOS)
# ======================

def get_photo_metadata():
    assets = get_assets(media_type='image')
    photo_count = len(assets)
    
    if photo_count == 0:
        return "No photos found"
    
    latest_photo = assets[-1]
    metadata = {
        "Total Photos": photo_count,
        "Latest Photo Date": latest_photo.creation_date,
        "Latest Photo Location": latest_photo.location if latest_photo.location else "No GPS data",
    }
    
    return metadata

# ======================
# SCREEN TIME & APP USAGE (Limited Access)
# ======================

def get_screen_time():
    return "Screen time data is restricted on iOS."

#
#impor
import platform
import time
import shutil
import requests
import socket
import photos
import json
from datetime import datetime

# ---------------- PERFORMANCE ANALYSIS ---------------- #
def get_system_info():
    print("\n--- SYSTEM PERFORMANCE ANALYSIS ---")
    print(f"System: {platform.system()} {platform.release()}")
    print(f"Device: {platform.machine()}")
    print(f"CPU Usage: {psutil.cpu_percent()}%")
    print(f"Memory Usage: {psutil.virtual_memory().percent}%")
    print(f"Battery: {psutil.sensors_battery().percent if psutil.sensors_battery() else 'N/A'}%")

# ---------------- STORAGE & FILE SYSTEM ANALYSIS ---------------- #
def get_storage_info():
    print("\n--- STORAGE ANALYSIS ---")
    total, used, free = shutil.disk_usage("/")
    print(f"Total Storage: {total / (1024 ** 3):.2f} GB")
    print(f"Used Storage: {used / (1024 ** 3):.2f} GB")
    print(f"Free Storage: {free / (1024 ** 3):.2f} GB")

# ---------------- NETWORK & INTERNET ANALYSIS ---------------- #
def get_network_info():
    print("\n--- NETWORK ANALYSIS ---")
    try:
        hostname = socket.gethostname()
        local_ip = socket.gethostbyname(hostname)
        external_ip = requests.get("https://api64.ipify.org?format=json").json()["ip"]
        print(f"Local IP: {local_ip}")
        print(f"External IP: {external_ip}")
    except Exception as e:
        print("Network Error:", e)

# ---------------- HEALTH & FITNESS ANALYSIS ---------------- #

    try:
        step_type = healthkit.HKQuantityType.quantityTypeForIdentifier_("HKQuantityTypeIdentifierStepCount")
        query = healthkit.HKSampleQuery.sampleQueryWithPredicate_limit_sortDescriptors_resultsHandler_(
            step_type, None, 1, None, lambda query, result, error: print(f"Today's Steps: {result[0].quantity().doubleValueForUnit_(healthkit.HKUnit.countUnit())}" if result else "No data")
        )
        store.executeQuery_(query)
    except Exception as e:
        print("Health Data Error:", e)

# ---------------- MEDIA ANALYSIS (PHOTOS & VIDEOS) ---------------- #
        

# ---------------- APP USAGE & SCREEN TIME ---------------- #


# ---------------- RUN ANALYSIS ---------------- #
    get_storage_info
    get_screen_time()
    
