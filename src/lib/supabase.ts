import { createClient } from '@supabase/supabase-js';

export const supabase = createClient(
	'https://tmectsmgdwavyxqeyiph.supabase.co',
	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRtZWN0c21nZHdhdnl4cWV5aXBoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY1NjU3MjIsImV4cCI6MjAzMjE0MTcyMn0.ah8t3C6okN4O8rpItwcQlnhqaarBOHv1gXNa6lMPhKU'
);
