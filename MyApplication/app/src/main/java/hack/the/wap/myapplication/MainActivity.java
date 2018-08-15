package hack.the.wap.myapplication;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.TextView;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MAIN";
    private TextView etEmail;
    private TextView etUsername;
    private TextView etPassword;
    private Button btnSubmit;
    private RequestQueue queue;
    private StringRequest stringRequest;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        queue = Volley.newRequestQueue(this);
        initView();
        initListener();
    }

    private void initView(){
        etEmail = findViewById(R.id.etEmail);
        etUsername = findViewById(R.id.etUsername);
        etPassword = findViewById(R.id.etPassword);
        btnSubmit = findViewById(R.id.btnSubmit);
    }

    private void initListener(){
        btnSubmit.setOnClickListener((v)->{
            Log.e("TAG", "initListener: " );
            initVolleySet();
        });
    }

    private void initVolleySet(){
        String url = "http://www.theceres.net:3000/api/user/";
        url+=etEmail.getText().toString()+"/";
        url+=etPassword.getText().toString()+"/";
        url+=etUsername.getText().toString()+"/";
        stringRequest = new StringRequest(Request.Method.POST,url,(response)->{},(error)->{});
        stringRequest.setRetryPolicy(new DefaultRetryPolicy(
                0,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        stringRequest.setTag(TAG);
        queue.add(stringRequest);
    }
}
