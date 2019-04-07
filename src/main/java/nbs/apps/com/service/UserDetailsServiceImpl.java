package nbs.apps.com.service;

import nbs.apps.com.model.UserDetail;
import nbs.apps.com.repository.IUserRepository;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import static java.util.Collections.emptyList;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    private IUserRepository userRepository;

    public UserDetailsServiceImpl(IUserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDetail applicationUserDetail = userRepository.findByUsername(username);
        if (applicationUserDetail == null) {
            throw new UsernameNotFoundException(username);
        }
        return new User(applicationUserDetail.getUsername(), applicationUserDetail.getPassword(), emptyList());
    }
}
