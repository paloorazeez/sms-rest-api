package nbs.apps.com.repository;

import nbs.apps.com.model.UserDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IUserRepository extends JpaRepository<UserDetail,Long> {
    UserDetail findByUsername(String username);
}
