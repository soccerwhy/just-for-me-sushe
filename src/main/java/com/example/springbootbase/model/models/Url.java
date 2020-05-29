
import com.example.springbootbase.model.models.Info;
import lombok.Data;

import java.util.List;


@Data
public class Url {

    private String url;

    private Long time;

    private Double timeNamelookup;

    private Double timeConnect;

    private Double timeStarttransfer;

    private Double timeTotal;

    private List<Info> infoList;
}
