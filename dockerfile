# STEP 1: Setup the base image for SDK to build the application
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Setup working directory
WORKDIR /source

# Copy the .csproj and .sln files to restore dependencies
COPY src/Application/Application.csproj .

# Restore the dependencies
RUN dotnet restore

# Run the test cases
RUN dotnet test

# Build the application using dotnet publish
RUN dotnet publish -c Release -o /app/published
