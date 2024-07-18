package functions;

import com.google.cloud.functions.HttpFunction;
import com.google.cloud.functions.HttpRequest;
import com.google.cloud.functions.HttpResponse;
import com.google.cloud.vertexai.VertexAI;
import com.google.cloud.vertexai.generativeai.GenerativeModel;
import com.google.cloud.vertexai.generativeai.ResponseHandler;

import io.github.cdimascio.dotenv.Dotenv;

import java.io.BufferedWriter;
import java.io.IOException;

public class ResumeGenerator implements HttpFunction {
    @Override
    public void service(HttpRequest request, HttpResponse response) throws IOException {
      var dotenv = Dotenv.load();

      var googleProjectId = dotenv.get("GOOGLE_PROJECT_ID");

      var vertexAILocation = dotenv.get("GOOGLE_VERTEX_AI_LOCATION");

      var genAIModelName = "gemini-1.5-flash-001";

      var vertexAI = new VertexAI(googleProjectId, vertexAILocation);

      var genAIModel = new GenerativeModel(genAIModelName, vertexAI);

      var generateContentResponse = genAIModel.generateContent("What is the meaning of life?");

        BufferedWriter writer = response.getWriter();
        writer.write(ResponseHandler.getText(generateContentResponse));
    }
}
