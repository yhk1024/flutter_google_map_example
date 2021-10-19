package com.example.csr_test_example;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
                requestPermissions(new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, 0);
            }
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        if (requestCode == 0 && verifyGrantResult(grantResults)) {
            Toast.makeText(this, "위치권한 동의 완료", Toast.LENGTH_LONG).show();
        }
    }
    private boolean verifyGrantResult(int[] grantResult){
        for(int result : grantResult) {
            if (result != PackageManager.PERMISSION_GRANTED)
                return false;
        }
        return true;
    }

//    // 지오펜싱 클라이언트의 인스턴스 연결
//    private GeofencingClient geofencingClient;
//
//    @Override
//    public void onCreate(Bundle savedInstanceState) {
//        // ...
//        geofencingClient = LocationServices.getGeofencingClient(this);
//    }
//
//    // 지오펜싱 전환을 위한 broadcast receiver 정의
//    private PendingIntent getGeofencePendingIntent() {
//        // Reuse the PendingIntent if we already have it.
//        if (geofencePendingIntent != null) {
//            return geofencePendingIntent;
//        }
//        Intent intent = new Intent(this, GeofenceBroadcastReceiver.class);
//        // We use FLAG_UPDATE_CURRENT so that we get the same pending intent back when
//        // calling addGeofences() and removeGeofences().
//        geofencePendingIntent = PendingIntent.getBroadcast(this, 0, intent, PendingIntent.
//                FLAG_UPDATE_CURRENT);
//        return geofencePendingIntent;
//    }
}
