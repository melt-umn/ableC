# 1 "sudo_plugin.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "sudo_plugin.c"
# 37 "sudo_plugin.c"
struct sudo_conv_message {






    int msg_type;
    int timeout;
    const char *msg;
};

struct sudo_conv_reply {
    char *reply;
};

typedef int (*sudo_conv_t)(int num_msgs, const struct sudo_conv_message msgs[],
 struct sudo_conv_reply replies[]);
typedef int (*sudo_printf_t)(int msg_type, const char *fmt, ...);


struct passwd;
struct policy_plugin {

    unsigned int type;
    unsigned int version;
    int (*open)(unsigned int version, sudo_conv_t conversation,
 sudo_printf_t sudo_printf, char * const settings[],
 char * const user_info[], char * const user_env[]);
    void (*close)(int exit_status, int error);
    int (*show_version)(int verbose);
    int (*check_policy)(int argc, char * const argv[],
 char *env_add[], char **command_info[],
 char **argv_out[], char **user_env_out[]);
    int (*list)(int argc, char * const argv[], int verbose,
 const char *list_user);
    int (*validate)(void);
    void (*invalidate)(int remove);
    int (*init_session)(struct passwd *pwd);
};


struct io_plugin {

    unsigned int type;
    unsigned int version;
    int (*open)(unsigned int version, sudo_conv_t conversation,
 sudo_printf_t sudo_printf, char * const settings[],
 char * const user_info[], char * const command_info[],
 int argc, char * const argv[], char * const user_env[]);
    void (*close)(int exit_status, int error);
    int (*show_version)(int verbose);
    int (*log_ttyin)(const char *buf, unsigned int len);
    int (*log_ttyout)(const char *buf, unsigned int len);
    int (*log_stdin)(const char *buf, unsigned int len);
    int (*log_stdout)(const char *buf, unsigned int len);
    int (*log_stderr)(const char *buf, unsigned int len);
};
# 118 "sudo_plugin.c"
struct sudoers_group_plugin {
    unsigned int version;
    int (*init)(int version, sudo_printf_t sudo_printf, char *const argv[]);
    void (*cleanup)(void);
    int (*query)(const char *user, const char *group, const struct passwd *pwd);
};
