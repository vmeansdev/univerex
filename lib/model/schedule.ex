defmodule Univerex.Schedule do
  @moduledoc """
  Schedule model
  """
  @derive [Univerex.Converter]
  @fields [:id, :subject, :instructor_id, :first_name, :middle_name,
           :last_name, :begin_time, :end_time, :event_type, :group_id,
           :group_name, :group_number, :sub_group_number, :study_form,
           :course_number, :building, :room, :pair_number, :term_number,
           :term_part, :week_day, :week_number] 
  defstruct @fields
end