import com.Service.UserService;
import com.Service.UserServiceImpl;
import com.Entity.User;
import org.junit.Test;

/**
 * @author MoYu-zc
 * @date 2020/12/17 8:41
 */
public class jdbc {

    @Test
    public void updateuser() {
        UserService userService = new UserServiceImpl();
        User user = new User(111111, "1", "1", 1, "1");
        int i = userService.upUser(user);
        System.out.println(i);

    }
}
