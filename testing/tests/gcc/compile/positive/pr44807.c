/* { dg-do compile } */

struct jobstats
{
  int j_jobslots;
};
struct jobstats js;
int *jobs;

typedef int sh_job_map_func_t (int *, int, int, int);

extern int sigprocmask (int __how, int __set, int __oset); // AbleC change: this is the wrong signature, but what this test expects.
extern int sigemptyset (int * __set); // AbleC change: this is the wrong signature, but what this test expects.
extern int sigaddset (int __set, int __signo); // AbleC change: this is the wrong signature, but what this test expects.

static void
map_over_jobs (sh_job_map_func_t func)
{
  int i;
  int set, oset;
  if (js.j_jobslots)
    return;
  sigemptyset (&set);
  sigaddset (set, 17);
  sigemptyset (&oset);
  sigprocmask (0, set, oset);
  for (i = 0; js.j_jobslots; i++)
    if (jobs[i])
      func (jobs, 0, 0, 0);
  sigprocmask (oset, ((void *) 0));
}

int
print_job (int *job, int format, int state, int job_index)
{
  map_over_jobs (print_job);
}

void
list_running_jobs (void)
{
  map_over_jobs (print_job);
}

