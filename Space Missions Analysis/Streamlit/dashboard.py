import pandas as pd
import plotly.express as px
import streamlit as st

st.set_page_config(
    page_title="Space Missions Dashboard",
    layout="wide"
)

# =====================
# CUSTOM CSS
# =====================
st.markdown("""
    <style>
    /* ----------- عامة ----------- */
    body, .stApp {
        background-color: #0B1020;
        color: #E5E7EB;
        font-family: 'Segoe UI', sans-serif;
    }

    /* ----------- العنوان الرئيسي ----------- */
    h1, h2, h3, h4 {
        color: #4F46E5;
        font-weight: 700 !important;
    }

    /* ----------- Sidebar ----------- */
    section[data-testid="stSidebar"] {
        background-color: #111827;
        padding: 20px;
        border-right: 2px solid #4F46E5;
    }
    .css-1d391kg p {
        color: #E5E7EB !important;
    }

    /* ----------- البطاقات (Metrics) ----------- */
    [data-testid="stMetric"] {
        background: linear-gradient(135deg, #4F46E5, #0EA5E9);
        padding: 20px;
        border-radius: 15px;
        text-align: center;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.5);
        color: white;
    }
    [data-testid="stMetricLabel"] {
        font-size: 16px !important;
        color: #F9FAFB !important;
    }
    [data-testid="stMetricValue"] {
        font-size: 24px !important;
        font-weight: bold !important;
        color: #FFF !important;
    }

    /* ----------- Tabs ----------- */
    .stTabs [role="tablist"] {
        background-color: #111827;
        border-radius: 12px;
        padding: 10px;
    }
    .stTabs [role="tab"] {
        color: #9CA3AF;
        padding: 10px 20px;
        font-weight: 600;
        border-radius: 10px;
    }
    .stTabs [aria-selected="true"] {
        background: linear-gradient(135deg, #4F46E5, #0EA5E9);
        color: white !important;
    }

    /* ----------- جداول ----------- */
    .stDataFrame div {
        color: #E5E7EB !important;
    }
    .stDataFrame th {
        background-color: #1F2937 !important;
        color: #F9FAFB !important;
    }
    .stDataFrame td {
        background-color: #111827 !important;
    }

    /* ----------- شارتات Plotly ----------- */
    .plotly .main-svg {
        background-color: transparent !important;
    }
    /* ----------- تعديل عناوين Metrics ----------- */
    [data-testid="stMetricLabel"] {
        font-size: 20px !important;
        color: #F9FAFB !important;
        text-align: center !important;   /* 🔥 يخلي العنوان في النص */
        display: block !important;       /* يخليها سطر كامل */
        width: 100%;                     /* يخليها تاخد عرض الكارت كله */
    }     
    
               

    </style>
""", unsafe_allow_html=True)



@st.cache_data
def load_data():
    # Load the dataset
    agencies = pd.read_csv("Data/agencies.csv")
    missions = pd.read_csv("Data/missions.csv")
    spacecraft = pd.read_csv("Data/spacecraft.csv")
    astronauts = pd.read_csv("Data/astronauts.csv")
    mission_crew = pd.read_csv("Data/mission_crew.csv")
    return agencies, missions, spacecraft, astronauts, mission_crew

agencies, missions, spacecraft, astronauts, mission_crew = load_data()
missions["launch_date"] = pd.to_datetime(missions["launch_date"], errors="coerce")
st.title("🌌 Space Missions Dashboard")
# ======================
# Sidebar Filters
# ======================
st.sidebar.header("Filter Options")
agencies_list = ["All"] + list(agencies["Agency_name"].unique())
selected_agency = st.sidebar.multiselect("Select Agency", agencies_list,default=["All"])

countries_list = ["All"] + list(agencies["Country"].unique())
selected_countries = st.sidebar.multiselect("Select Countries", countries_list, default=["All"])

types_list = ["All"] + list(missions["Mission_type"].unique())
selected_types = st.sidebar.multiselect("Select Mission Types", types_list, default=["All"])

status_list = ["All"] + list(missions["Status"].unique())
selected_status = st.sidebar.multiselect("Select Mission Status", status_list, default=["All"])

# ======================
# Apply Filters
# ======================
filtered_missions = pd.merge(missions, agencies, on="Agency_id", how="left")



# filtered_missions.to_csv("filtered_missions.csv", index=False)  

if "All" not in selected_agency:
    filtered_missions = filtered_missions[filtered_missions["Agency_name"].isin(selected_agency)]

if "All" not in selected_countries:
    filtered_missions = filtered_missions[filtered_missions["Country"].isin(selected_countries)]

if "All" not in selected_types:
    filtered_missions = filtered_missions[filtered_missions["Mission_type"].isin(selected_types)]

if "All" not in selected_status:
    filtered_missions = filtered_missions[filtered_missions["Status"].isin(selected_status)]    


col1, col2 ,col3,col4 = st.columns(4)
with col1:
    total_missions = len(missions)
    st.metric(label="Total Missions", value=total_missions)
with col2:
    total_agencies = len(agencies)
    st.metric(label="Total Agencies", value=total_agencies)    
with col3:
    total_spacecraft = len(spacecraft)
    st.metric(label="Total Spacecraft", value=total_spacecraft)  
with col4:
    toal_astron = len(astronauts)
    st.metric(label="Total Astronauts", value=toal_astron)    
      
# ======================
# Tabs
# ======================
tab1, tab2, tab3, tab4, tab6 = st.tabs(["🚀 Mission Overview", "🏢 Agency Performance", "🛰️ Spacecraft Analysis", "👩‍🚀 Mission Crew","📅 Timeline & Highlights"])

with tab1:
    st.subheader("Mission Overview")
    

    # ======================
    # First Row (2 Charts)
    # ======================
    col1, col2 = st.columns(2)

    with col1:
        # Missions by Agency (Bar Chart)
        missions_by_agency = filtered_missions.groupby("Agency_name")["Mission_id"].count().reset_index()
        missions_by_agency = missions_by_agency.sort_values(by="Mission_id", ascending=False).head(10)

        fig1 = px.bar(
            missions_by_agency,
            x="Agency_name",
            y="Mission_id",
            title="Missions by Agency",
            text="Mission_id",
            color="Agency_name",
            color_continuous_scale="Blues",
            height=550
            

        )
        fig1.update_layout(xaxis_title="Agency", yaxis_title="Number of Missions", template="plotly_white",  title={
        'text': "Missions by Agency",
        'y':0.95,           
        'x':0.5,            
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 28,     
             
            'family': "Arial" 
        }
    })
        fig1.update_traces(texttemplate="%{text:.0f}", textposition="outside",textfont=dict(size=14))
        st.plotly_chart(fig1, use_container_width=True)

    with col2:
        # Mission Timeline (Line Chart)
        missions_timeline = filtered_missions.groupby(filtered_missions["launch_date"].dt.year)["Mission_id"].count().reset_index()
        missions_timeline.columns = ["Year", "Missions"]

        fig2 = px.line(
            missions_timeline,
            x="Year",
            y="Missions",
            markers=True,
            title="Mission Timeline",
            height=550
        )
        fig2.update_traces(textposition="top center") 
        fig2.update_layout(xaxis_title="Year", yaxis_title="Number of Missions", template="plotly_white",
                            title={
        'text': "Mission Timeline",
        'y':0.95,           
        'x':0.5,            
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 28,     
             
            'family': "Arial" 
        }
    })
        st.plotly_chart(fig2, use_container_width=True)

    # ======================
    # Second Row (2 Charts)
    # ======================
    col3, col4 = st.columns(2)

    with col3:
        # Mission Type Distribution (Bar Chart)
        mission_types = filtered_missions["Mission_type"].value_counts().reset_index()
        mission_types.columns = ["Mission Type", "Count"]

        fig3 = px.bar(
            mission_types,
            x="Mission Type",
            y="Count",
            color="Count",
            text="Count",
            color_continuous_scale="Viridis",
            title="Mission Type Distribution"
        )
        fig3.update_layout(xaxis_title="Mission Type", yaxis_title="Number of Missions", template="plotly_white",
                            title={
        'text': "Mission Type Distribution",
        'y':0.95,           
        'x':0.5,            
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 28,     
             
            'family': "Arial" 
        }
    })
        st.plotly_chart(fig3, use_container_width=True)

    with col4:
        # Mission Status Breakdown (Donut Chart)
        status_counts = filtered_missions["Status"].value_counts().reset_index()
        status_counts.columns = ["Status", "Count"]

        fig4 = px.pie(
            status_counts,
            names="Status",
            values="Count",
            hole=0.4,
            title="Mission Status Breakdown"
        )
        fig4.update_layout(template="plotly_white",
                             title={
        'text': "Mission Status Breakdown",
        'y':0.95,           
        'x':0.5,            
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 28,     
             
            'family': "Arial" 
                              }
                 })
        fig4.update_traces(textposition="inside", textinfo="percent+label")
        st.plotly_chart(fig4, use_container_width=True)
   
    dest_count = filtered_missions["Destination"].value_counts().reset_index()
    dest_count.columns = ["Destination", "Missions"]

    fig4 = px.bar(dest_count.head(10), x="Destination", y="Missions", title="Top 10 Missions per Destination",
                  text="Missions",)
    fig4.update_traces(texttemplate="%{text:.0f}", textposition="outside",textfont=dict(size=14))
    fig4.update_layout(template="plotly_white", xaxis_title="Destination", yaxis_title="Number of Missions", xaxis_tickangle=-45,
                        title={
        'text': "Top 10 Missions per Destination",
        'y':0.95,           
        'x':0.5,            
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 28,     
             
            'family': "Arial" 
        }
    })
    st.plotly_chart(fig4, use_container_width=True)
 





# =========================
#  Tab 2: Agency Performance


with tab2:
    st.header("🏢 Agency Performance")

    # ---------------------------
    # Prepare merged dataframe
    # ---------------------------
    try:
        merged = filtered_missions.copy()  
    except NameError:
      
        merged = missions.merge(agencies, on="Agency_id", how="left")


    merged["duration_days"] = pd.to_numeric(merged["duration_days"], errors="coerce")
    
    merged["launch_date"] = pd.to_datetime(merged["launch_date"], errors="coerce")
    agencies["Budget_billion_usd"] = pd.to_numeric(agencies["Budget_billion_usd"], errors="coerce").fillna(0)

    # ---------------------------
    # 1) Average Mission Duration per Agency (Bar)
    # ---------------------------
    avg_duration = (
        merged.groupby("Agency_name", as_index=False)["duration_days"]
        .mean()
        .rename(columns={"duration_days": "Avg_Duration_days"})
        .sort_values("Avg_Duration_days", ascending=False)
    )
    avg_duration["Avg_Duration_days"] = avg_duration["Avg_Duration_days"].round(1)
    avg_duration = avg_duration.head(10) 

    fig_duration = px.bar(
        avg_duration,
        x="Agency_name",
        y="Avg_Duration_days",
        text="Avg_Duration_days",
        title="Average Mission Duration per Agency",
        labels={"Agency_name": "Agency", "Avg_Duration_days": "Avg Duration (days)"},
        color="Agency_name",
        color_continuous_scale="Oranges"
    )
    fig_duration.update_traces(texttemplate="%{text:.1f}", textposition="inside")
    fig_duration.update_layout(template="plotly_white", xaxis_tickangle=-45, title={
        'text': "Average Mission Duration per Agency",
        'y':0.95,           
        'x':0.5,            
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 28,     
             
            'family': "Arial" 
        }
    })


    # ---------------------------
    # ---------------------------
    # 3) Agency Budget vs Number of Missions (Scatter)
    # ---------------------------
    missions_count = (
        merged.groupby("Agency_id", as_index=False)
        .agg(NumMissions=("Mission_id", "count"))
    )

    agencies_summary = (
        agencies[["Agency_id", "Agency_name", "Country", "Budget_billion_usd"]]
        .merge(missions_count, on="Agency_id", how="left")
        .fillna({"NumMissions": 0})
    )

    fig_scatter = px.scatter(
        agencies_summary,
        x="Budget_billion_usd",
        y="NumMissions",
        size="NumMissions",
        hover_name="Agency_name",
        hover_data=["Country", "Budget_billion_usd", "NumMissions"],
        title="Agency Budget (Billion USD) vs Number of Missions",
        labels={"Budget_billion_usd": "Budget (Billion USD)", "NumMissions": "Number of Missions"},
        color="Country"
    )
    fig_scatter.update_layout(template="plotly_white", title={
        'text': "Agency Budget (Billion USD) vs Number of Missions",
        'y':0.95,           
        'x':0.5,
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 22,     
            'family': "Arial" }
        
        })
    fig_scatter.update_traces(marker=dict(sizemode="area"), selector=dict(mode="markers"))



    
    col1, col2 = st.columns(2)
    with col1:
        st.plotly_chart(fig_duration, use_container_width=True)
    with col2:
        st.plotly_chart(fig_scatter, use_container_width=True)    
    

      
    # 4) Top 10 Country Agencies by Agencies (Bar)
    agncy_country = filtered_missions["Country"].value_counts().reset_index()
    agncy_country.columns = ["Country", "Number of Agencies"]
    agncy_country = agncy_country.sort_values(by="Number of Agencies", ascending=False)

    fig_country = px.bar(
        agncy_country.head(10),  
        x="Country",
        y="Number of Agencies",
        title="Top 10 Country Agencies by Agencies",
        labels={"Country": "Country", "Number of Agencies": "Number of Agencies"},
        text="Number of Agencies",
        color="Country",
        color_continuous_scale="Reds"
    )
    #
    fig_country.update_traces(texttemplate="%{text:.0f}", textposition="inside",textangle=0)
    fig_country.update_layout(template="plotly_white", title={
        'text': "Top 10 Country Agencies by Agencies",
        'y':0.95,           
        'x':0.5,            
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 28,     
             
            'family': "Arial" 
        }
    })
    st.plotly_chart(fig_country, use_container_width=True)






    # =========================
filtered_missions= pd.merge(spacecraft, filtered_missions, on="Mission_id", how="left")
if "All" not in selected_agency:
    filtered_missions = filtered_missions[filtered_missions["Agency_name"].isin(selected_agency)]

if "All" not in selected_countries:
    filtered_missions = filtered_missions[filtered_missions["Country"].isin(selected_countries)]

if "All" not in selected_types:
    filtered_missions = filtered_missions[filtered_missions["Mission_type"].isin(selected_types)]

if "All" not in selected_status:
    filtered_missions = filtered_missions[filtered_missions["Status"].isin(selected_status)] 







    
with tab3:
    st.subheader("🛰️ Spacecraft Analysis")


    col1, col2 = st.columns(2)

    with col1:
        # Spacecraft Types (Pie Chart)
        type_counts = filtered_missions["Type"].value_counts().reset_index()
        type_counts.columns = ["Type", "Count"]

        fig_type = px.pie(
            type_counts,
            names="Type",
            values="Count",
            title="Spacecraft Types Distribution",
            hole=0.4,
            height=600
        )
        fig_type.update_traces(textposition="inside", textinfo="percent+label", textfont=dict(size=14))
        fig_type.update_layout(template="plotly_white",
                             title={
        'text': "Spacecraft Types Distribution",
        'y':0.95,
        'x':0.5,
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 28,
            'family': "Arial"
                              }
                 })
        st.plotly_chart(fig_type, use_container_width=True)

    with col2:
        # Manufacturer Market Share (Bar Chart)
        manuf_counts = filtered_missions["Manufacturer"].value_counts().reset_index()
        manuf_counts.columns = ["Manufacturer", "Count"]

        fig_manuf = px.bar(
            manuf_counts.head(10),  # عرض Top 10
            x="Manufacturer",
            y="Count",
            text="Count",
            title="Top Manufacturers Market Share",
            color="Manufacturer",
            height=600
        )
        fig_manuf.update_traces(
            texttemplate="%{text}",
            textposition="outside",
            textfont=dict(size=14)
        )
        fig_manuf.update_layout(
            template="plotly_white",
            xaxis_tickangle=-45,
            bargap=0.3,
            showlegend=False,
            title={
                'text': "Top Manufacturers Market Share",
                'y':0.95,
                'x':0.5,
                'xanchor': 'center',
                'yanchor': 'top',
                'font': {
                    'size': 28,
                    'family': "Arial"
                }
            }
        )
        st.plotly_chart(fig_manuf, use_container_width=True)

  
    col3, col4 = st.columns(2)

    with col3:
        # Spacecraft Cost Trends (Line Chart)
        cost_trends = (
            filtered_missions.groupby("first_launch_year", as_index=False)["Cost_million_usd"]
            .mean()
        )

        fig_cost = px.line(
            cost_trends,
            x="first_launch_year",
            y="Cost_million_usd",
            markers=True,
            title="Average Spacecraft Cost Trends",
            height=600
        )
        fig_cost.update_traces(line=dict(width=3))
        fig_cost.update_layout(
            template="plotly_white",
            xaxis_title="Year",
            yaxis_title="Avg Cost (M USD)",
            title={
                'text': "Average Spacecraft Cost Trends",
                'y':0.95,
                'x':0.5,
                'xanchor': 'center',
                'yanchor': 'top',
                'font': {
                    'size': 28,
                    'family': "Arial"
                }
            }
        )
        st.plotly_chart(fig_cost, use_container_width=True)

    with col4:
        # Cost vs Duration of Missions (Scatter Plot)
        merged_space = spacecraft.merge(missions, on="Mission_id", how="left")

        fig_scatter = px.scatter(
            filtered_missions,
            x="duration_days",
            y="Cost_million_usd",
            color="Type",
            hover_name="Spacecraft_name",
            title="Cost vs Duration of Missions",
            labels={"duration_days": "Duration (days)", "Cost_million_usd": "Cost (M USD)"},
            height=600
        )
        fig_scatter.update_traces(marker=dict(size=10, opacity=0.7, line=dict(width=1, color="DarkSlateGrey")))
        fig_scatter.update_layout(template="plotly_white", title={
            'text': "Cost vs Duration of Missions",
            'y':0.95,
            'x':0.5,
            'xanchor': 'center',
            'yanchor': 'top',
            'font': {
                'size': 28,
                'family': "Arial"}


        }
            )
        st.plotly_chart(fig_scatter, use_container_width=True)
#! --------------------------------------------------------------------


# Merge data once for easier analysis
filtered_missions= pd.merge(mission_crew, filtered_missions, on="Mission_id", how="left")
if "All" not in selected_agency:
    filtered_missions = filtered_missions[filtered_missions["Agency_name"].isin(selected_agency)]

if "All" not in selected_countries:
    filtered_missions = filtered_missions[filtered_missions["Country"].isin(selected_countries)]

if "All" not in selected_types:
    filtered_missions = filtered_missions[filtered_missions["Mission_type"].isin(selected_types)]

if "All" not in selected_status:
    filtered_missions = filtered_missions[filtered_missions["Status"].isin(selected_status)] 

# =========================
# --> Tab 4: Mission Crew
# =========================
with tab4:
    st.subheader("Mission Crew Analysis")
    
    col1, col2 = st.columns(2)
    with col1:
        # Crew Size Distribution (Pie Chart)
        crew_size = filtered_missions.groupby("Mission_id").size().reset_index(name="Crew Size")
        crew_size_counts = crew_size["Crew Size"].value_counts().reset_index()
        crew_size_counts.columns = ["Crew Size", "Count"]
        fig1 = px.pie(crew_size_counts, names="Crew Size", values="Count", title="Crew Size Distribution", hole=0.4)
        fig1.update_traces(textfont=dict(size=14))
        fig1.update_layout(template="plotly_white",
                             title={
        'text': "Crew Size Distribution",   
        'y':0.95,
        'x':0.5,
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 28,
            'family': "Arial"
                              }
                 }
        )
        st.plotly_chart(fig1, use_container_width=True)
       
        

    with col2:
        role_dist = filtered_missions["Role"].value_counts().reset_index()
        role_dist.columns = ["Role", "Count"]

        fig2 = px.bar(role_dist, x="Role", y="Count",title="Crew Role Distribution",
            labels={"Role": "Role", "Count": "Number of Astronauts"},
            color="Role",
            color_continuous_scale="Blues"
        )
        fig2.update_layout(template="plotly_white",
                            title={
        'text': "Crew Role Distribution",
        'y':0.95,           
        'x':0.5,            
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 28,     
            'family': "Arial" 
        }
    })
        st.plotly_chart(fig2, use_container_width=True)

    # Role composition by agency
    role_agency = filtered_missions.groupby(["Agency_name", "Role"]).size().reset_index(name="Count")
    role_agency = role_agency.sort_values(by=["Agency_name", "Role"]).head(50)
    fig3 = px.bar(role_agency, x="Count", y="Agency_name", color="Role", title="Crew Role Composition by Agency",
        labels={"Agency_name": "Agency", "Count": "Number of Astronauts"},
        orientation="h",
        barmode="stack",
        height=600
    )
    fig3.update_layout(template="plotly_white",
                        title={
        'text': "Crew Role Composition by Agency",
        'y':0.95,
        'x':0.5,
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 28,
            'family': "Arial"
        }
    })

    
    st.plotly_chart(fig3, use_container_width=True)



# =========================
#  Tab 6: Time & Highlight
# =========================
with tab6:
    st.subheader("Time & Highlight")
    
    # First mission per agency
    missions["launch_date_formatted"] = missions['launch_date'].dt.strftime('%Y-%m-%d')

    first_mission = (
        missions.sort_values("launch_date")
        .groupby("Agency_id").first().reset_index()
        .merge(agencies, on="Agency_id")[["Agency_name", "Mission_name", "launch_date_formatted"]]
    )
    
    col1, col2 =st.columns(2)
    with col1:
        st.write("First Mission per Agency")
        st.dataframe(first_mission)

        
    

    # start creating the longest and shortest mission per agency table
    
    longest_per_agency = missions.loc[missions.groupby("Agency_id")["duration_days"].idxmax()]
    longest_per_agency = (
        longest_per_agency.merge(agencies, on="Agency_id")[["Agency_name", "Mission_name", "duration_days"]]
        .rename(columns={"Mission_name": "Longest Mission", "duration_days": "Longest Duration in Days"})
    )

    # Shortest mission per agency
    shortest_per_agency = missions.loc[missions.groupby("Agency_id")["duration_days"].idxmin()]
    shortest_per_agency = (
        shortest_per_agency.merge(agencies, on="Agency_id")[["Agency_name", "Mission_name", "duration_days"]]
        .rename(columns={"Mission_name": "Shortest Mission", "duration_days": "Shortest Duration in Days"})
    )

    # Merge longest & shortest into one table
    extremes = pd.merge(longest_per_agency, shortest_per_agency, on="Agency_name")
    with col2:
        st.write("Longest and Shortest Missions per Agency")
        st.dataframe(extremes.rename(columns={"Agency_name": "Agency"}))

    
    # Cumulative missions over time
    filtered_missions["Year"] = filtered_missions["launch_date"].dt.year
    yearly_status = filtered_missions.groupby(["Year", "Status"]).size().reset_index(name="Count")
    yearly_status["Cumulative"] = yearly_status.groupby("Status")["Count"].cumsum()

    fig7 = px.line(yearly_status, x="Year", y="Cumulative", color="Status",title="Cumulative Missions Over Time by Status")
    fig7.update_layout(template="plotly_white",
                        title={
        'text': "Cumulative Missions Over Time by Status",
        'y':0.95,
        'x':0.5,
        'xanchor': 'center',
        'yanchor': 'top',
        'font': {
            'size': 28,
            'family': "Arial"
        }
    })
    st.plotly_chart(fig7, use_container_width=True)
