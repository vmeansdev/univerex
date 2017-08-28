# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :univerex,
    base_url: "https://example.com/api/",
    faculties: "faculties",
    groups: "groups/faculty_id/",
    current_term: "current_term/group_id/",
    schedule: "study_schedule/group_id/"