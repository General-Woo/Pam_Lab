package com.example.lab_1;


import android.Manifest;
import android.app.SearchManager;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.MediaStore;
import android.support.annotation.RequiresApi;
import android.support.v7.app.AppCompatActivity;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;
import java.io.FileNotFoundException;
import java.io.InputStream;



@SuppressWarnings("ALL")
public class MainActivity extends AppCompatActivity {

    public boolean checkCam;
    private static final int MY_CAMERA_REQUEST_CODE = 100;
    private static final int CAMERA_ACTION_CODE = 1;

    private void searchNet(String words){
        Intent intent= new Intent(Intent.ACTION_WEB_SEARCH);
        intent.putExtra(SearchManager.QUERY, words);
        startActivity(intent);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        ImageView imageView = findViewById(R.id.camera_preview);
        super.onActivityResult(requestCode, resultCode, data);

        if (resultCode == RESULT_OK) {
            try {
                final Uri imageUri = data.getData();
                final InputStream imageStream = getContentResolver().openInputStream(imageUri);
                final Bitmap selectedImage = BitmapFactory.decodeStream(imageStream);
                imageView.setImageBitmap(selectedImage);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                Toast.makeText(this, "Something went wrong", Toast.LENGTH_LONG).show();
            }
        }else {        }

        Toast.makeText(this, "You haven't picked Image",Toast.LENGTH_LONG).show();
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);



        Button photoBtn = findViewById(R.id.photoButton);
        EditText editText = findViewById(R.id.searchText);

        Button changeCamBtn = findViewById(R.id.changeCamera);
        Button rearCamBtn = findViewById(R.id.radioButtonRear);
        Button frontCamBtn = findViewById(R.id.radioButtonFront);


        photoBtn.setOnClickListener(v -> {
            Intent intent = new Intent(Intent.ACTION_PICK);
            intent.setType("image/*");
            startActivityForResult(intent, CAMERA_ACTION_CODE);
        });

        rearCamBtn.setOnClickListener(v -> checkCam = true);

        frontCamBtn.setOnClickListener(v -> checkCam = false);

        changeCamBtn.setOnClickListener(v -> {

            if (checkSelfPermission(Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED) {
                requestPermissions(new String[]{Manifest.permission.CAMERA}, MY_CAMERA_REQUEST_CODE);
            }else{
                Toast.makeText(getApplicationContext(),
                        "Permission is already granted",
                        Toast.LENGTH_LONG
                ).show();
            }

            if(checkCam){
                Intent launchIntent = new Intent(MediaStore.INTENT_ACTION_STILL_IMAGE_CAMERA);
                launchIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                launchIntent.putExtra("android.intent.extras.CAMERA_FACING", android.hardware.Camera.CameraInfo.CAMERA_FACING_FRONT);
                launchIntent.putExtra("android.intent.extras.LENS_FACING_FRONT", 0);
                launchIntent.putExtra("android.intent.extra.USE_FRONT_CAMERA", false);
                startActivity(launchIntent);
            }else{
                Intent launchIntent = new Intent(MediaStore.INTENT_ACTION_STILL_IMAGE_CAMERA);
                launchIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                launchIntent.putExtra("android.intent.extras.CAMERA_FACING", android.hardware.Camera.CameraInfo.CAMERA_FACING_FRONT);
                launchIntent.putExtra("android.intent.extras.LENS_FACING_FRONT", 1);
                launchIntent.putExtra("android.intent.extra.USE_FRONT_CAMERA", true);
                startActivity(launchIntent);
            }
        });

        Button srchBtn = findViewById(R.id.searchButton);
        srchBtn.setOnClickListener(v -> {
            String search = editText.getText().toString();
            if(!search.equals("") ){
                searchNet(search);
            }
        });

        Button notifBtn = findViewById(R.id.notificatinButton);
        notifBtn.setOnClickListener(v -> {
            Toast.makeText(getApplicationContext(),
                    "This a notification toast message",
                    Toast.LENGTH_LONG
            ).show();
        });

    }
}