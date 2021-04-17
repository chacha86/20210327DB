import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// DTO, VO, Data Class
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Article {
	private String title;
	private String body;
	
}
